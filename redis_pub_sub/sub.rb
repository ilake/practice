require 'rubygems'
require 'redis'
require 'json'

$redis = Redis.new(:timeout => 1)

$redis.subscribe('rubyonrails', 'ruby-lang') do |on|
  on.message do |channel, msg|
    data = JSON.parse(msg)
    puts "##{channel} - [#{data['user']}]: #{data['msg']}"
  end
end
