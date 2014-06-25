define [
  'jquery'
  'underscore'
  'backbone'
  'templates'
  'views/shots'
], ($, _, Backbone, JST, ShotsView) ->
  class PlayerView extends Backbone.View

    template: JST['app/scripts/templates/player.hbs']

    el: '.player'

    events: {
        'click .back': 'goBack'
    }

    initialize: () ->
        @render()

    render: () ->
        @$el.html @template(@model)

    goBack: (e) ->
        e.preventDefault()
        length = Backbone.history.history.length
        if length > 1
            Backbone.history.history.back(length-1)
        else
            Backbone.history.history.back(length)
        @$el?.empty()

