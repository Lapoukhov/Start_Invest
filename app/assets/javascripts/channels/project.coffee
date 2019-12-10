App.project = App.cable.subscriptions.create "ProjectChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('comment').append data['comment']

  speak: (comment) ->
    @perform 'speak', comment: comment

$(document).on 'keypress', '[data-behavior~=project_speaker]', (event) ->
  if event.keyCode is 13
    App.project.speak event.target.value
    event.target.value = ''
    event.preventDefault()