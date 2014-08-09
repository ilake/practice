source = new EventSource('/messages/events')
source.addEventListener "messages.channel.#{gon.channel}.create", (e) ->
  message = $.parseJSON(e.data)
  $('#chat').append($("<li data-name='#{message.name}'>").text("#{message.name}: #{message.content}"))

source.addEventListener "messages.channel.#{gon.channel}.destroy", (e) ->
  message = $.parseJSON(e.data)
  $('#chat').find("[data-name='#{message.name}']").remove()
