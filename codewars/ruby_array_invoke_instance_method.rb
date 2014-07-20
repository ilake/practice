# http://www.codewars.com/kata/ruby-array-invoke-instance-method/ruby
class Array
  def invoke(name, *args, &block)
    self.map do |item|
      if block_given?
        item.method(name).call(*args) if block.call(item)
      else
        item.method(name).call(*args)
      end
    end.compact
  end
end

# Best practice
class Array
  def invoke(method, *args, &block)
    select(&block).map {|item| item.send(method, *args) }
  end
end
