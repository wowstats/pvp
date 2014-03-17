define (require) ->
  Backbone = require('backbone')

  return class Rankings extends Backbone.Collection
    url: () -> "http://#{@region}.battle.net/api/wow/leaderboard/rankings/#{@bracket}"

    initialize: (options = {}) ->
      @region = options.region or 'us'
      @bracket = options.bracket or '2v2'

      @fetch({reset: true, dataType: 'jsonp'})

    parse: (response) ->
      return response.rankings
