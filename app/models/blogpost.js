'use strict'

const mongoose = require('mongoose')

const blogpostSchema = new mongoose.Schema({
  blogpostTitle: {
    type: String,
    // AZ: Need to Change this back to true once the front end has been completed.
    required: false
  },
  templateType: {
    type: Number,
    // AZ: Need to Change this back to true once the front end has been completed.
    required: false
  },
  header: {
    type: String,
    required: true
  },
  subHeader: {
    type: String,
    required: true
  },
  blogpostContent: {
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
//       ret.editable = userId && userId.equals(doc.owner)
//       return ret
//     }
//   }
// }
)

// blogpostSchema.virtual('length').get(function length () {
//   // Changed text to title.
//   return this.title.length
// })

const Blogpost = mongoose.model('Blogpost', blogpostSchema)

module.exports = Blogpost
