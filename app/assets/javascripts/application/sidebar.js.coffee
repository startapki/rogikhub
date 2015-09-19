$ ->
  $('body').on 'click', '[data-toggle=sidebar]', (e) ->
    e.preventDefault()
    $('#wrapper').toggleClass 'toggled'
