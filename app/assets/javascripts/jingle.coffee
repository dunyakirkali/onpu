class @Jingle
  constructor: (options = {}) ->
    target = options.target
    file = options.file
    $(target).jPlayer
      solution: 'html'
      supplied: 'mp3'
      cssSelector:
        play: '.icon-play3'
        pause: '.icon-pause2'
      ready: (event) ->
        $(this).jPlayer 'setMedia',
          mp3: file
        return
      play: ->
        $('.icon-play3').addClass('hidden')
        $('.icon-pause2').removeClass('hidden')
      pause: ->
        $('.icon-play3').removeClass('hidden')
        $('.icon-pause2').addClass('hidden')
    return