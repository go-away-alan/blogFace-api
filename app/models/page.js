'use strict'

const mongoose = require('mongoose')

const pageSchema = new mongoose.Schema({
  pageTitle: {
    type: String,
    required: true
  },
  templateType: {
    type: Number,
    required: true
  },
  header: {
    type: String,
    required: true
  },
  subheader: {
    type: String,
    required: true
  },
  pageContent: {
    type: String,
    required: true
  },
  contact: {
    type: String,
    required: true
  },
  owner: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  }
}
// AZ: Commented this out for the time being because we're not requiring timestamps and virtuals.
// , {
//   timestamps: true,
//   toJSON: {
//     virtuals: true,
//     transform: function (doc, ret, options) {
//       const userId = (options.user && options.user._id) || false
//       ret.editable = userId && userId.equals(doc._owner)
//       return ret
//     }
//   }
// }
)

// pageSchema.virtual('length').get(function length () {
//   // Changed text to title.
//   return this.title.length
// })

const Page = mongoose.model('Page', pageSchema)

module.exports = Page
