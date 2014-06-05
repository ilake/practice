require 'rss'
require 'open-uri'
require 'celluloid'

class FeedCounter
  include Celluloid

  def initialize(url)
    @url = url
  end

  def count
    open(@url) do |f|
      rss = RSS::Parser.parse(f.read, false)
      count = rss.items.size
      puts "#{count} in #{@url}"
      count
    end
  end
end

# counts = $*.map { |url| FeedCounter.new(url).count }
# total = counts.inject(:+)
# puts "#{total} total" if total

# If we call future.value before the asynchronous method has completed it will wait until it completes so that it can return the value
futures = $*.map { |url| FeedCounter.new(url).future(:count) }
total = futures.map(&:value).inject(:+)
puts "#{total} total" if total


class PoolFeedCounter
  include Celluloid

  # Instead of initializing a PoolFeedCounter with a URL we’ll pass it in to the count method so that it becomes a local variable instead of an instance variable.
  # This way all feed counters will be the same so now pass each URL into the call to future.
  def initialize
  end

  def count(url)
    open(url) do |f|
      rss = RSS::Parser.parse(f.read, false)
      count = rss.items.size
      puts "#{count} in #{@url}"
      count
    end
  end
end

pool = PoolFeedCounter.pool(size:6) # defaults to the number of cores on our machine
futures = $*.map { |url| pool.new.future(:count, url) }
total = futures.map(&:value).inject(:+)
puts "#{total} total" if total
