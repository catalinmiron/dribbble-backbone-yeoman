define [
  'backbone'
  'views/shots'
  'views/app'
], (Backbone, ShotsView, AppView) ->
  class Router extends Backbone.Router
    routes: {
      '': 'home'
      'shot/:id': 'showShot'
      'shots/:id': 'showShots'
      'player/:id': 'showPlayer'
    }

    home: ->
      console.log 'home'
      App.router.navigate("shots/1", true)

    showShot: (id) ->
      console.log 'shot ' + id
      App.Vent.trigger('showShot', {id: id})

    showShots: (id) ->
      console.log 'shots | page: ' + id
      App.currentPage = id
      App.Vent.trigger('showShots', {id: id})

    showPlayer: (id) ->
      console.log 'plater | id: ' + id
      App.currentPage = id
      App.Vent.trigger('showPlayer', {id: id})
