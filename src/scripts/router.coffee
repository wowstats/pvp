define (require) ->
  Backbone = require('backbone')
  AppView = require('cs!pages/app/app')

  return new class Router extends Backbone.Router
    initialize: () ->
      @appView = new AppView()

      # Default Route
      @route '*actions', 'index', () ->
        @appView.render('pvp')
