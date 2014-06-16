require 'socket'

def handleRequest(channel)
  while true
    input = channel.gets.chop
    break if !input
    break if input=="quit"
    channel.puts("ok")
    channel.flush
  end
  channel.close
end

server = TCPServer.open(8080)         # Listen on port 8080

fork { # something else
}

while true
  client = server.accept
  Thread.start(client) do |channel|
    handleRequest(channel)
  end
end
