define [
  'jquery'
  'underscore'
  'backbone'
  'handlebars'
  'templates'
], ($, _, Backbone, Handlebars, JST) ->
  class ShotView extends Backbone.View

    template: JST['app/scripts/templates/shot.hbs']

    el: '.shot'

    tagName: 'div'

    className: 'shot'

    events: {
        'click .back': 'goBack'
    }

    initialize: () ->
        @render()

    render: () ->
        @$el.html @template(@model)

