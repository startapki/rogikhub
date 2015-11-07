$ ->
  $('body').on 'click', '[data-toggle=sidebar]', (e) ->
    e.preventDefault()
    $('.simple-sidebar-wrapper').toggleClass 'toggled'
