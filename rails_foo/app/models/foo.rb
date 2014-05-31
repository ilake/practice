# http://api.rubyonrails.org/classes/ActiveSupport/Callbacks.html
# http://api.rubyonrails.org/classes/ActiveSupport/Callbacks/ClassMethods.html

class Bar
  def before(caller)
    puts "Bar before called"
  end

  def before_foo(caller)
    puts "Bar before_foo called"
  end

  def foo(caller)
    puts "Bar foo called"
  end
end

class Foo
  include ActiveSupport::Callbacks

  CALLBACK_NAME = :foo

  define_callbacks CALLBACK_NAME, terminator: ->(target, result) { target.skip_callback },
                                  skip_after_callbacks_if_terminated: true, scope: [:name]
  # only one will be trigger
  # set_callback CALLBACK_NAME, :before, :before_callback
  set_callback CALLBACK_NAME, :before, ::Bar.new

  def skip_callback
    true
  end

  def before_callback
    puts "before trigger foo"
  end

  def trigger_callback
    run_callbacks CALLBACK_NAME do
      puts "trigger foo"
    end
  end

  set_callback CALLBACK_NAME, :after do |obj|
    puts "after trigger foo"
  end
end
