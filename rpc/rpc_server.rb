# http://stackoverflow.com/questions/9309239/how-to-correctly-use-built-in-xmlrpc-in-ruby
require "xmlrpc/server"

# s = XMLRPC::CGIServer.new
# 
# s.add_handler("sample.sumAndDifference") do |a, b|
#     { "sum" => a + b, "difference" => a - b }
# end
# 
# s.serve

server = XMLRPC::Server.new( 16384 )
server.add_handler('my_test.test') do |msg|
  "responce for #{msg}"
end

server.add_handler('command.shutdown') do
  server.shutdown
end

at_exit do
  puts "good bye"
end

puts "======================"
server.serve
