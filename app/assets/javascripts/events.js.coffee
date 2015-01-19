$(document).on "ready page:load", ->
  source = new EventSource('/events/status')
  source.addEventListener 'message', (e) ->
    $("[data-role='status-time-container']").text(e.data)
