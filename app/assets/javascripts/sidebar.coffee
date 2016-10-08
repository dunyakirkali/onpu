class @Sidebar
  constructor: (options = {}) ->
    @animating = false
    $('body').on 'click', =>
      if $('#sidebar').hasClass('visible')
        @close()

    $('#sidebar').on 'click', (event) =>
      @stopPropagation()
      @toggle()

  toggle: () ->
    return if @animating
    if $('#sidebar').hasClass('visible')
      @close()
    else
      @open()

  open: () ->
    return if @animating
    @animating = true
    $('#sidebar').removeClass('slideOutRight').addClass('slideInLeft').addClass('visible')
    $('#sidebar').one 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', () =>
      $('#sidebar').removeClass('slideInLeft')
      @animating = false

  close: () ->
    return if @animating
    @animating = true
    $('#sidebar').removeClass('slideInLeft').addClass('slideOutLeft')
    $('#sidebar').one 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', () =>
      $('#sidebar').removeClass('visible').removeClass('slideOutLeft')
      @animating = false

  stopPropagation: () ->
    if !e
      e = window.event
    e.cancelBubble = true
    if e.stopPropagation
      e.stopPropagation()
