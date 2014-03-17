define (require) ->
  $ = require('jquery')
  Backbone = require('backbone')
  router = require('cs!router')
  require('less!../styles/main')

  init = (options = {}) ->
    external = new RegExp('^((f|ht)tps?:)?\/\/')

    # Catch internal application links and let Backbone handle the routing
    $(document).on 'click', 'a[href]:not([data-bypass]):not([href^="#"])', (e) ->
      $this = $(this)
      href = $this.attr('href')

      # Only handle links intended to be processed by Backbone
      if e.isDefaultPrevented() or href.charAt(0) is '#' or /^mailto:.+/.test(href) then return

      e.preventDefault()

      if external.test(href)
        window.open(href, '_blank')
      else
        router.navigate(href, {trigger: $this.data('trigger') or true})

    Backbone.history.start
      pushState: true

  return {init: init}
