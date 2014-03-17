define (require) ->
  BaseView = require('cs!helpers/backbone/views/base')
  RegionView = require('cs!modules/region/region')
  template = require('hbs!./pvp-template')
  require('less!./pvp')

  return class PvPPage extends BaseView
    template: template

    regions:
      us: '.us'
      eu: '.eu'

    onRender: () ->
      @regions.us.show(new RegionView('us'))
      @regions.eu.show(new RegionView('eu'))
