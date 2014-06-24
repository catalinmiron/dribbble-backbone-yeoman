#/*global require*/
'use strict'

require.config
  shim:
    bootstrap:
      deps: ['jquery'],
      exports: 'jquery'
    handlebars:
      exports: 'Handlebars'
    jribbble:
      deps: ['jquery']
  paths:
    jquery: '../bower_components/jquery/dist/jquery'
    backbone: '../bower_components/backbone/backbone'
    underscore: '../bower_components/underscore/underscore'
    bootstrap: '../bower_components/sass-bootstrap/dist/js/bootstrap'
    handlebars: '../bower_components/handlebars/handlebars'
    hbs: '../bower_components/hbs/hbs'
    jribbble: 'libs/jribbble'

require [
  'views/app'
], (AppView) ->

    window.App = {
      Vent: _.extend({}, Backbone.Events)
    }
    App.Vent.on "all", (eventName) ->
        console.log(eventName + ' was triggered!');

    new AppView()
