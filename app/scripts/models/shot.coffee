define [
  'underscore'
  'backbone'
], (_, Backbone) ->
  'use strict';

  class ShotModel extends Backbone.Model
    url: '',

    initialize: () ->

    defaults: {
      name: ''
      occupation: ''
      email: ''
      age: 0
    }

    validate: (attrs, options) ->

    parse: (response, options) ->
      response
