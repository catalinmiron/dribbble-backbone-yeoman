define [
  'jquery'
  'underscore'
  'backbone'
  'hbs!../templates/shot'
], ($, _, Backbone, hbs) ->
  class ShotView extends Backbone.View

    el: '.shot'

    tagName: 'div'

    className: 'shot'

    events: {
        'click .back': 'goBack'
    }

    initialize: () ->
        @render()

    render: () ->
        @$el.html hbs(@model)

