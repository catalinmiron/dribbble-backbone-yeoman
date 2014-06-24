define [
  'underscore'
  'backbone'
  'models/shot'
], (_, Backbone, ShotModel) ->

  class ShotCollection extends Backbone.Collection

    model: ShotModel
