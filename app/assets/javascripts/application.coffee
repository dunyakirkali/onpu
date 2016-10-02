#= require jquery
#= require semantic-ui
#= require jquery_ujs
#= require howler
#= require isotope
#= require jplayer
#= require jingle

$ ->
  $('#jingles').on('click', () ->
    $('.ui.sidebar').sidebar('toggle')
  )
