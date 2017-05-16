'use strict'

// Copied from examples.js and modified to say pages instead of examples.
const controller = require('lib/wiring/controller')
const models = require('app/models')
const Page = models.page

const authenticate = require('./concerns/authenticate')
// const setUser = require('./concerns/set-current-user')
const setModel = require('./concerns/set-mongoose-model')

const index = (req, res, next) => {
  Page.find()
    .then(pages => res.json({
      pages: pages.map((e) =>
        e.toJSON({ virtuals: true
          // , user: req.user
        }))
    }))
    .catch(next)
}

const show = (req, res) => {
  res.json({
    page: req.page.toJSON({ virtuals: true
      // , user: req.user
    })
  })
}

const destroy = (req, res, next) => {
  console.log('ReqPage is ', req.page)
  req.page.remove()
    .then(() => res.sendStatus(204))
    .catch(next)
}

const create = (req, res, next) => {
  console.log('ReqUser is ', req.user)
  // When we create, it will fill in the owner for you. In other words, it adds a key, owner, to req.body.example and sets the req.user._id as well.
  const page = Object.assign(req.body.page, {
    owner: req.user._id
  })
  console.log(page)
  // Executes the create on the Page model with the page object.
  // This page object is created with data from the client and the current user as owner.
  Page.create(page)
    // The newly created page we get from database is rendered as JSON.
    .then(page =>
      res.status(201)
        .json({
          page: page.toJSON({ virtuals: true, user: req.user })
        }))
    // Fire off error handler if any of the ".then" is an error.
    .catch(next)
}

const update = (req, res, next) => {
  // Protects against malicious users by deleting the owner key from req.body.
  delete req.body.owner  // disallow owner reassignment.
  // Updates the example in the database.
  req.page.update(req.body.page)
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
  { method: setModel(Page), only: ['show'] },
  { method: setModel(Page, { forUser: true }), only: ['update', 'destroy'] }
] })
