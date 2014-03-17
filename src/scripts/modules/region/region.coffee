define (require) ->
  BaseView = require('cs!helpers/backbone/views/base')
  Region = require('cs!models/region')
  template = require('hbs!./region-template')
  require('less!./region')

  return class RegionView extends BaseView
    template: template

    initialize: (region) ->
      super()

      @model = new Region(region)

      @listenTo(@model, 'update', @render)
