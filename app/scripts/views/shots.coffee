define [
  'jquery'
  'underscore'
  'backbone'
  'hbs!../templates/shots'
  'views/shot'
  'views/player'
  'views/players'
  'collections/player'
  'jribbble'
], ($, _, Backbone, hbs, ShotView, PlayerView, PlayersView, PlayerCollection, jribbble) ->
  class ShotsView extends Backbone.View

    el: '.shots'

    events: {
        'click .single': 'showCurrentShot'
        'click .player-link': 'showCurrentPlayer'
        'click .pagination a': 'fetchNewData'
        'click .next': 'nextPage'
    }

    initialize: ->
      App.Vent.on 'showShot', @getShot, @
      App.Vent.on 'showShots', @getShots, @
      App.Vent.on 'showPlayer', @getPlayer, @
      @getShots(1)

    showAll: (collection) =>
      @$el.empty()
      @shots = _.clone(collection)
      console.log @shots
      @$el.html hbs(model: @shots)

    showShot: (model) =>
      @$el.empty()
      console.log model
      new ShotView({
        model: model
      })

    showPlayer: (model) =>
      @$el.empty()
      new PlayerView({
        model: model
      })

    getShot: (attrs) ->
      @$el.empty()
      if attrs.id
          attrs = attrs.id
      $.jribbble.getShotById attrs, (shot) =>
        @showShot(shot)

    getPlayer: (attrs) ->
      if attrs.id
          attrs = attrs.id
      $.jribbble.getPlayerById attrs, (player) =>
        @player = player
        @showPlayer(player)
        @getPlayerShots(player)


    getShots: (attrs) ->
      # console.log @collection
      @attrs = attrs.id
      @$el.empty()
      $.jribbble.getShotsByList 'popular', (data) =>
        data = data.shots
        @showAll(data)
      ,
        {
          page: attrs.id
          per_page: 30
        }

    getPlayerShots: (player) =>
       $.jribbble.getShotsByPlayerId player.username, (playerShots) =>
            console.log playerShots.shots
            new PlayersView({
              collection: new PlayerCollection(playerShots.shots)
            })
          {
            page: 1
            per_page: 100
          }

    fetchNewData: (e) ->
      e.preventDefault()
      id = $(e.currentTarget).data('id')
      if not id
        return
      App.router.navigate("shots/" + id, true)

    nextPage: (e) ->
      e.preventDefault()
      nextPage = parseInt(App.currentPage) + 1
      # Redirect user to the new page
      App.router.navigate("shots/" + nextPage, true)

    showCurrentPlayer: (e) ->
        e.preventDefault()
        currentId = $(e.currentTarget).data('id')
        App.router.navigate("player/" + currentId, true)

    showCurrentShot: (e) =>
        e.preventDefault()
        currentId = $(e.currentTarget).data('id')
        App.router.navigate("shot/" + currentId, true)
