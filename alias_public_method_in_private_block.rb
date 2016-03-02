class Foo
  def foo
    puts "foo"
  end

  protected
  alias_method :bar, :foo
end

Foo.new.bar
