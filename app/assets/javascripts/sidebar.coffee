class @Sidebar
  constructor: (options = {}) ->
    button = options.button
    target = options.target
    $('main').on 'click', button, ->
      if $(target).hasClass('hide')
        $(target).addClass('visible')
        $(target).removeClass('hide')
      else
        $(target).addClass('hide')
        $(target).removeClass('visible')