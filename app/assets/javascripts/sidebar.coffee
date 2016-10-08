class @Sidebar
  constructor: (options = {}) ->
    $('body').on 'click', (event) =>
      if event.target.id == 'sidebar'
        @toggle()
      else
        if $('#sidebar').hasClass('visible')
          @close()

  toggle: () ->
    if $('#sidebar').hasClass('visible')
      @close()
    else
      @open()

  open: () ->
    $('#sidebar').addClass('visible')

  close: () ->
    $('#sidebar').removeClass('visible')

  stopPropagation: () ->
    if !e
      e = window.event
    e.cancelBubble = true
    if e.stopPropagation
      e.stopPropagation()
