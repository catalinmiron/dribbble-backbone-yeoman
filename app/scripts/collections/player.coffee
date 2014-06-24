define [
  'underscore'
  'backbone'
  'models/player'
], (_, Backbone, PlayerModel) ->

  class PlayerCollection extends Backbone.Collection
    model: PlayerModel
