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
        $('.icon-play3').addClass('icon-pause2').removeClass('.icon-play3')
    return