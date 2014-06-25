define [
  'jquery'
  'underscore'
  'backbone'
  'templates'
  'jribbble'
], ($, _, Backbone, JST, ShotView, PlayerView, jribbble) ->
  class ShotsView extends Backbone.View

    template: JST['app/scripts/templates/players.hbs']
    el: '.player-shots'

    initialize: ->
      @render()

    render: (collection) =>
      console.log @collection
      console.log collection
      @$el.append @template(shot: @collection.toJSON())
