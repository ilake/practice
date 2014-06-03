# Ruby’s require is not atomic
# class instance variable is not atomic
@@global = 1
class Foo
  require_relative 'bar'
  @bar = 0

  def initialize
  end

  def foo
    puts 'foo'
  end

  def self.bar
    @@global = @@global + 1

    @bar = @bar + 1
    # puts "@@global #{ @@global }"
    puts "@bar #{@bar}"
  end
end

3.times.map do
  Thread.new do

    f = Foo.new
    # f.foo
    Foo.bar
  end
end.each(&:join)

f = Thread.new do
  Foo.bar
end
f.join

# ->
# I am bar library
# foo
# foo
# foo
