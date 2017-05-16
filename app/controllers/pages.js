'use strict'

// Copied from examples.js and modified to say books instead of examples.
const controller = require('lib/wiring/controller')
const models = require('app/models')
const Book = models.book

const authenticate = require('./concerns/authenticate')
// const setUser = require('./concerns/set-current-user')
const setModel = require('./concerns/set-mongoose-model')

const index = (req, res, next) => {
  Book.find()
    .then(books => res.json({
      books: books.map((e) =>
        e.toJSON({ virtuals: true
          // , user: req.user
        }))
    }))
    .catch(next)
}

const show = (req, res) => {
  res.json({
    book: req.book.toJSON({ virtuals: true
      // , user: req.user
    })
  })
}

const destroy = (req, res, next) => {
  req.book.remove()
    .then(() => res.sendStatus(204))
    .catch(next)
}

const create = (req, res, next) => {
  // When we create, it will fill in the owner for you. In other words, it adds a key, _owner, to req.body.example and sets the req.user._id as well.
  const book = Object.assign(req.body.book, {
    _owner: req.user._id
  })
  console.log(book)
  // Executes the create on the Book model with the book object.
  // This book object is created with data from the client and the current user as _owner.
  Book.create(book)
    // The newly created book we get from database is rendered as JSON.
    .then(book =>
      res.status(201)
        .json({
          book: book.toJSON({ virtuals: true, user: req.user })
        }))
    // Fire off error handler if any of the ".then" is an error.
    .catch(next)
}

const update = (req, res, next) => {
  // Protects against malicious users by deleting the owner key from req.body.
  delete req.body._owner  // disallow owner reassignment.
  // Updates the example in the database.
  req.book.update(req.body.book)
    // If update is successful, then send 204 error message to the client.
    .then(() => res.sendStatus(204))
    // Otherwise, update fails and send error handler message.
    .catch(next)
}

module.exports = controller({
  index,
  show,
  create,
  update,
  destroy
}, { before: [
  // { method: setUser, only: ['index', 'show'] },
  { method: authenticate, except: ['index', 'show'] },
  { method: setModel(Book), only: ['show'] },
  { method: setModel(Book, { forUser: true }), only: ['update', 'destroy'] }
] })
