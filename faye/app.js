var http = require('http'),
    faye = require('faye')


var serverAuth = {
      incoming: function (message, callback) {
        if (message.channel.match(/\/meta\/.+/)) {
          console.log('FORMAL CHANNEL');
          return callback(message);
        }
        else {
          var token = message.ext && message.ext.auth_token;
          console.log('token:' + token);
          if ( token != 'iamtoken' ) {
            message.error = 'Invalid authentication token';
            console.log('Invalid authentication token')
          }
        }

        console.log('Incoming:', message);
        callback(message);
      }
    };

var server = http.createServer(),
    bayeux = new faye.NodeAdapter({
      mount: '/faye',
      timeout: 15
    });

bayeux.attach(server);
bayeux.addExtension(serverAuth);
server.listen(4567);

bayeux.on('handshake', function (clientId) {
  console.log('Handshake: ' + clientId);
});

bayeux.on('subscribe', function (clientId, channel) {
  console.log('Subscribe: ' + clientId + ', ' + channel);
});

bayeux.on('unsubscribe', function (clientId, channel) {
  console.log('Unsubscribe: ' + clientId + ', ' + channel);
});

bayeux.on('publish', function (clientId, channel, data) {
  console.log('Publish: ' + clientId + ', ' + channel + ', ' + JSON.stringify(data));
});

bayeux.on('disconnect', function (clientId) {
  console.log('Disconnect: ' + clientId);
});

