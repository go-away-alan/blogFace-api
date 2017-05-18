'use strict'

const mongoose = require('mongoose')

const blogpostSchema = new mongoose.Schema({
  blogpostTitle: {
    type: String,
    // AZ: Need to Change this back to true once the front end has been completed.
    required: true
  },
  blogpostContent: {
    type: String,
    required: true
  },
  owner: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  }
}, {
  timestamps: true,
  toJSON: {
    virtuals: true,
    transform: function (doc, ret, options) {
      const userId = (options.user && options.user._id) || false
      ret.editable = userId && userId.equals(doc.owner)
      return ret
    }
  }
})

blogpostSchema.virtual('length').get(function length () {
  // Changed text to title.
  return this.blogpostTitle.length
})

const Blogpost = mongoose.model('Blogpost', blogpostSchema)

module.exports = Blogpost
