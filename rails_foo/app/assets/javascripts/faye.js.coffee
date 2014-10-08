#= require faye-browser.js

client = new Faye.Client('http://localhost:4567/faye', {
  timeout: 120,
  retry: 5
})
clientAuth = (auth_token) ->
  {
    outgoing: (message, callback) ->
      if (message.channel != '/meta/subscribe')
        return callback(message)

      message.ext ||= {}
      message.ext.auth_token = 'iamtoken' # auth_token
      callback(message)
  }

client.addExtension(clientAuth)

subscription = client.subscribe '/foo', (message) ->
  alert(message)

subscription.then ->
  alert('subscription active')

