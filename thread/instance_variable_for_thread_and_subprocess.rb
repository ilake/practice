# class Bar
#   def self.context
#     Thread.current[:faria_mq_context] ||= {}
#   end
# 
#   def self.channel
#     context[:channel] ||= "Channel #{ Random.rand(10) }"
#   end
# end

class Foo
  def rand
    @rand ||= Random.rand(10)
  end
end

foo = Foo.new

# Thread, fork will keep the instance variable.
# puts "Main1 #{ foo.rand }"
fork {
  puts "child process #{ foo.rand }"
}

Thread.new {
  puts "Thread #{ foo.rand }"
}

puts "Main2 #{ foo.rand }"

