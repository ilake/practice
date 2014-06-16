require "xmlrpc/client"

# # Make an object to represent the XML-RPC server.
# server = XMLRPC::Client.new( "xmlrpc-c.sourceforge.net", "/api/sample.php")
# 
# # Call the remote server and get our result
# result = server.call("sample.sumAndDifference", 5, 3)
# 
# sum = result["sum"]
# difference = result["difference"]
# 
# puts "Sum: #{sum}, Difference: #{difference}"
client = XMLRPC::Client.new( "localhost", "/", 16384)
s = client.call2('my_test.test','asd')
# s = client.call('my_test.test','asd')
# p s

client.call2('command.shutdown')
