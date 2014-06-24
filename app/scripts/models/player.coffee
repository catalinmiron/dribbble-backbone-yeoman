define [
  'underscore'
  'backbone'
], (_, Backbone) ->
  'use strict';

  class PlayerModel extends Backbone.Model

    initialize: () ->

    defaults: {}

    validate: (attrs, options) ->

    parse: (response, options) ->
      response
