'use strict'

// Copied from examples.js and modified to say blogposts instead of examples.
const controller = require('lib/wiring/controller')
const models = require('app/models')
const Blogpost = models.blogpost

const authenticate = require('./concerns/authenticate')
const setUser = require('./concerns/set-current-user')
const setModel = require('./concerns/set-mongoose-model')

const index = (req, res, next) => {
  Blogpost.find({owner: req.user.id})
    .then(blogposts => res.json({
      blogposts: blogposts.map((e) =>
        e.toJSON({ virtuals: true, user: req.user }))
    }))
    .catch(next)
}

const show = (req, res) => {
  res.json({
    blogpost: req.blogpost.toJSON({ virtuals: true
      // , user: req.user
    })
  })
}

const destroy = (req, res, next) => {
  // console.log('ReqBlogpost is ', req.blogpost)
  req.blogpost.remove()
    .then(() => res.sendStatus(204))
    .catch(next)
}

const create = (req, res, next) => {
  // console.log('ReqUser is ', req.user)
  // When we create, it will fill in the owner for you. In other words, it adds a key, owner, to req.body.example and sets the req.user._id as well.
  const blogpost = Object.assign(req.body.blogpost, {
    owner: req.user._id
  })
  // console.log(blogpost)
  // Executes the create on the Blogpost model with the blogpost object.
  // This blogpost object is created with data from the client and the current user as owner.
  Blogpost.create(blogpost)
    // The newly created blogpost we get from database is rendered as JSON.
    .then(blogpost =>
      res.status(201)
        .json({
          blogpost: blogpost.toJSON({ virtuals: true, user: req.user })
        }))
    // Fire off error handler if any of the ".then" is an error.
    .catch(next)
}

const update = (req, res, next) => {
  // Protects against malicious users by deleting the owner key from req.body.
  delete req.body.owner  // disallow owner reassignment.
  // Updates the example in the database.
  req.blogpost.update(req.body.blogpost)
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
  { method: setUser, only: ['index', 'show'] },
  { method: authenticate, except: ['index', 'show'] },
  { method: setModel(Blogpost), only: ['show'] },
  { method: setModel(Blogpost, { forUser: true }), only: ['update', 'destroy'] }
] })
