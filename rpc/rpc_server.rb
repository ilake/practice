require "xmlrpc/server"

# s = XMLRPC::CGIServer.new
# 
# s.add_handler("sample.sumAndDifference") do |a, b|
#     { "sum" => a + b, "difference" => a - b }
# end
# 
# s.serve

server = XMLRPC::Server.new( 1234 )
server.add_handler('my_test.test') do |msg|
  "responce for #{msg}"
end
server.serve
