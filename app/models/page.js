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
  subHeader: {
    type: String,
    required: true
  },
  pageContent: {
    type: String,
    required: true
  },
  pageContentMore: {
    type: String,
    required: false
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
})

const Page = mongoose.model('Page', pageSchema)

module.exports = Page
