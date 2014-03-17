define (require) ->
  Backbone = require('backbone')
  Rankings = require('cs!collections/rankings')
  require('backbone-associations')

  TITLES = {
    challenger: 0.35
    rival: 0.1
    duelist: 0.03
    gladiator: 0.005
    rank1: 0.001
  }

  return class Bracket extends Backbone.AssociatedModel
    relations: [{
      type: Backbone.Many
      key: 'rankings'
      collectionType: () -> Rankings
    }]

    initialize: (options = {}) ->
      @set('rankings', new Rankings(options))

      @listenTo(@get('rankings'), 'reset', @setup)

    setup: () ->
      previousRank = 0
      stats = @get('rankings').reduce (memo, player) ->
        # Only include players with a rating of 1000 or higher
        if player.get('rating') >= 1000
          players = player.get('rank') - previousRank
          previousRank = player.get('rank')
          memo.totalRating += player.get('rating') * players
          memo.totalPlayers += players

        return memo
      , {totalRating: 0, totalPlayers: 0}
      stats.average = Math.round(stats.totalRating / stats.totalPlayers)

      @set('stats', stats)

      @set('titles', {
        rank1: @calcTitle('rank1')
        gladiator: @calcTitle('gladiator')
        duelist: @calcTitle('duelist')
        rival: @calcTitle('rival')
        challenger: @calcTitle('challenger')
      })

      @trigger('setup')

      return @

    calcTitle: (title) ->
      listing = @get('rankings')
      stats = @get('stats')
      rank = stats.totalPlayers * TITLES[title]

      position = listing.find (player) -> player.get('rank') > rank
      index = listing.indexOf(position)
      position = if index is 0 then listing.at(index) else listing.at(index - 1)

      return {
        rank: position.get('rank')
        rating: position.get('rating')
      }
