class @Sidebar
  constructor: (options = {}) ->
    $('body').on 'click', =>
      @close()

    $('#sidebar').on 'click', (event) =>
      @stopPropagation()
      @toggle()

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
