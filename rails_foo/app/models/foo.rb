# http://api.rubyonrails.org/classes/ActiveSupport/Callbacks.html
class Foo
  include ActiveSupport::Callbacks

  CALLBACK_NAME = :foo

  define_callbacks CALLBACK_NAME
  set_callback CALLBACK_NAME, :before, :before_callback

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
