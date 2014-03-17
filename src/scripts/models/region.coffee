define (require) ->
  Backbone = require('backbone')
  Bracket = require('cs!models/bracket')
  require('backbone-associations')

  return class Region extends Backbone.AssociatedModel
    relations: [{
      type: Backbone.One
      key: 'twos'
      relatedModel: Bracket
    }, {
      type: Backbone.One
      key: 'threes'
      relatedModel: Bracket
    }, {
      type: Backbone.One
      key: 'fives'
      relatedModel: Bracket
    }, {
      type: Backbone.One
      key: 'rbgs'
      relatedModel: Bracket
    }]

    initialize: (region = 'us') ->
      @set('region', region.toUpperCase())

      @set('twos', new Bracket({bracket: '2v2', region: region}))
      @set('threes', new Bracket({bracket: '3v3', region: region}))
      @set('fives', new Bracket({bracket: '5v5', region: region}))
      @set('rbgs', new Bracket({bracket: 'rbg', region: region}))

      @listenTo(@, 'setup:twos setup:threes setup:fives setup:rbgs', @triggerUpdate)

    triggerUpdate: () -> @trigger('update')
