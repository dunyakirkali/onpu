class @Sidebar
  constructor: (options = {}) ->
    button = options.button
    target = options.target
    $('body').on 'click', button, ->
      if $(target).hasClass('visible')
        $(target).removeClass('visible')
      else

        $(target).addClass('visible')
