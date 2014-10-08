# require 'sinatra'
# require 'faye/websocket'
require 'faye'

# ROOT_DIR = File.expand_path('../..', __FILE__)
# set :root, ROOT_DIR

faye_server = Faye::RackAdapter.new(:mount   => '/faye',
                                    :timeout => 25
                                   )
# Faye::WebSocket.load_adapter('puma')
# def App.log(message)
#   puts message
# end


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
