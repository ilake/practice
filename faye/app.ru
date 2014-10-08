# require 'sinatra'
# require 'faye/websocket'
require 'faye'
Faye::WebSocket.load_adapter('thin') # become long-polling without this

class ServerAuth
  def incoming(message, callback)
    if message['channel'] !~ %r{^/meta/}
      if message['ext']['auth_token'] != 'iamtoken'
        message['error'] = 'Invalid authentication token'
      end
    end
    callback.call(message)
  end

  # IMPORTANT: clear out the auth token so it is not leaked to the client
  def outgoing(message, callback)
    if message['ext'] && message['ext']['auth_token']
      message['ext'] = {} 
    end
    callback.call(message)
  end
end

faye_server = Faye::RackAdapter.new(:mount   => '/faye',
                                    :timeout => 25
                                   )

faye_server.add_extension(ServerAuth.new)

faye_server.on(:subscribe) do |client_id, channel|
  puts "[  SUBSCRIBE] #{client_id} -> #{channel}"
end

faye_server.on(:publish) do |client_id, channel, data|
  puts "[  PUBLISH] #{client_id} -> #{channel}"
end

faye_server.on(:unsubscribe) do |client_id, channel|
  puts "[UNSUBSCRIBE] #{client_id} -> #{channel}"
end

faye_server.on(:disconnect) do |client_id|
  puts "[ DISCONNECT] #{client_id}"
end

run faye_server
