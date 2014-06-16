require "bunny"

# Start a communication session with RabbitMQ
conn = Bunny.new
conn.start

# open a channel
ch = conn.create_channel

# declare a queue
q  = ch.queue("test1")

# publish a message to the default exchange which then gets routed to this queue
q.publish("Hello, everybody!")

# fetch a message from the queue
# It would fail because bunny is multithread, and fork would not copy the thread.
# fork {
#   delivery_info, metadata, payload = q.pop
#   puts "This is the message: #{payload}"
#   sleep (2)
# }
Thread.new {
  delivery_info, metadata, payload = q.pop
  puts "This is the message: #{payload}"
  sleep (2)
}

puts Process.pid
puts Thread.list.size
puts Thread.list.find_all {|t| t != Thread.main }.size


# close the connection
conn.stop
