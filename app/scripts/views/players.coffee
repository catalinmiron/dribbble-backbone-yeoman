define [
  'jquery'
  'underscore'
  'backbone'
  'hbs!../templates/players'
  'jribbble'
], ($, _, Backbone, hbs, ShotView, PlayerView, jribbble) ->
  class ShotsView extends Backbone.View

    el: '.player-shots'

    initialize: ->
      @render()

    render: (collection) =>
      console.log @collection
      console.log collection
      @$el.append hbs(shot: @collection.toJSON())
