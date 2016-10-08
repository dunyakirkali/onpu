class @Sidebar
  constructor: (options = {}) ->
    $('body').on 'click', =>
      if $('#sidebar').hasClass('visible')
        @close()

    $('#sidebar').on 'click', (event) =>
      @stopPropagation()
      @toggle()

    $('#sidebar a, #sidebar input').on 'click', (event) =>
      @stopPropagation()

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
