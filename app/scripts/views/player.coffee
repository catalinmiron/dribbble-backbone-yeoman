define [
  'jquery'
  'underscore'
  'backbone'
  'hbs!../templates/player'
  'views/shots'
], ($, _, Backbone, hbs, ShotsView) ->
  class PlayerView extends Backbone.View

    el: '.player'

    events: {
        'click .back': 'goBack'
    }

    initialize: () ->
        @render()

    render: () ->
        @$el.html hbs(@model)

    goBack: (e) ->
        e.preventDefault()
        length = Backbone.history.history.length
        if length > 1
            Backbone.history.history.back(length-1)
        else
            Backbone.history.history.back(length)
        @$el?.empty()

