#= require jquery
#= require semantic-ui
#= require jquery_ujs
#= require howler
#= require isotope
#= require jplayer
#= require jingle
#= require sidebar

$ ->
  $('#jingles').on('click', () ->
    $('.ui.sidebar').sidebar('toggle')
  )

  new Sidebar({
    button: '.slide-out'
    target: '#sidebar'
  })