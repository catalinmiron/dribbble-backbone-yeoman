define [
  'jquery'
  'underscore'
  'backbone'
  'collections/shots'
  'views/shots'
  'routes/router'
  'jribbble'
], ($, _, Backbone, ShotsCollection, ShotsView, AppRouter) ->

  class AppView extends Backbone.View

    initialize: ->
      App.router = new AppRouter()
      # Enable pushState for compatible browsers
      enablePushState = true

      # Tells Backbone to start watching for hashchange events
      Backbone.history.start()
      @initiliazeView()


    initiliazeView: () ->
      new ShotsView({
          collection: new ShotsCollection()
        })

