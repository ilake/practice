practice
========

my practice place

so far nothing here lol.

========
where is rails provide rack

1. `bundle show actionpack`
2. ls lib/action_dispatch/middleware

rack utils

1. `bundle show rack`


=======
## rack list

- use DummyMiddleware
- use Rack::Sendfile
- use ActionDispatch::Static
- use Rack::Lock
- use #<ActiveSupport::Cache::Strategy::LocalCache::Middleware:0x00000102212f70>
- use Rack::Runtime
  - [https://github.com/rack/rack/blob/master/lib/rack/runtime.rb](https://github.com/rack/rack/blob/master/lib/rack/runtime.rb)
- use Rack::MethodOverride
- use ActionDispatch::RequestId
  - [https://github.com/rails/rails/blob/master/actionpack/lib/action_dispatch/middleware/request_id.rb](https://github.com/rails/rails/blob/master/actionpack/lib/action_dispatch/middleware/request_id.rb)
  - ```
    (rdb:1) request.env["action_dispatch.request_id"]
    => "cf486c62-3544-4d91-95d9-763acae5a7fe"
    ```
    
- use Rails::Rack::Logger
- use ActionDispatch::ShowExceptions
  - [https://github.com/rails/rails/blob/master/actionpack/lib/action_dispatch/middleware/show_exceptions.rb](https://github.com/rails/rails/blob/master/actionpack/lib/action_dispatch/middleware/show_exceptions.rb)
- use ActionDispatch::DebugExceptions
  - [https://github.com/rails/rails/blob/master/actionpack/lib/action_dispatch/middleware/debug_exceptions.rb](https://github.com/rails/rails/blob/master/actionpack/lib/action_dispatch/middleware/debug_exceptions.rb)
- use ActionDispatch::RemoteIp
  - [https://github.com/rails/rails/blob/master/actionpack/lib/action_dispatch/middleware/remote_ip.rb](https://github.com/rails/rails/blob/master/actionpack/lib/action_dispatch/middleware/remote_ip.rb)
  - [http://blog.gingerlime.com/2012/rails-ip-spoofing-vulnerabilities-and-protection](http://blog.gingerlime.com/2012/rails-ip-spoofing-vulnerabilities-and-protection)
- use ActionDispatch::Reloader
  - [https://github.com/rails/rails/blob/master/actionpack/lib/action_dispatch/middleware/reloader.rb](https://github.com/rails/rails/blob/master/actionpack/lib/action_dispatch/middleware/reloader.rb)
- use ActionDispatch::Callbacks
  - [https://github.com/rails/rails/blob/master/actionpack/lib/action_dispatch/middleware/reloader.rb](https://github.com/rails/rails/blob/master/actionpack/lib/action_dispatch/middleware/reloader.rb)
  - [http://rack.rubyforge.org/doc/Rack/BodyProxy.html](http://rack.rubyforge.org/doc/Rack/BodyProxy.html)
- use ActiveRecord::Migration::CheckPending
- use ActiveRecord::ConnectionAdapters::ConnectionManagement
- use ActiveRecord::QueryCache
- use ActionDispatch::Cookies
- use ActionDispatch::Session::CookieStore
- use ActionDispatch::Flash
- use ActionDispatch::ParamsParser
- use Rack::Head
- use Rack::ConditionalGet
- use Rack::ETag
- run RailsFoo::Application.routes

### references
- [http://guides.rubyonrails.org/rails_on_rack.html](http://guides.rubyonrails.org/rails_on_rack.html)
- [http://railscasts.com/episodes/151-rack-middleware](http://railscasts.com/episodes/151-rack-middleware)
- [http://pothibo.com/2013/11/ruby-on-rails-inside-actiondispatch-and-rack/](http://pothibo.com/2013/11/ruby-on-rails-inside-actiondispatch-and-rack/)
- [http://railscasts.com/episodes/301-extracting-a-ruby-gem?view=asciicast](http://railscasts.com/episodes/301-extracting-a-ruby-gem?view=asciicast)

## Concurrency
- [What do multi-processes VS multi-threaded servers most benefit from?](http://stackoverflow.com/questions/18575235/what-do-multi-processes-vs-multi-threaded-servers-most-benefit-from)
- [http://www.ruby-doc.org/core-2.1.1/Thread.html](http://www.ruby-doc.org/core-2.1.1/Thread.html)
- [並發(Concurrency)和並行(Parallelism)的區別](http://www.vaikan.com/defining-concurrency-and-parallelism/)
- [Concurrency is not Parallelism](http://concur.rspace.googlecode.com/hg/talk/concur.html#landing-slide)
- [Concurrency and Database Connections in Ruby with ActiveRecord](https://devcenter.heroku.com/articles/concurrency-and-database-connections)
- http://railscasts.com/episodes/367-celluloid
- Thread safe
  - [http://railscasts.com/episodes/365-thread-safety](http://railscasts.com/episodes/365-thread-safety)
  - [http://lucaguidi.com/2014/03/27/thread-safety-with-ruby.html](http://lucaguidi.com/2014/03/27/thread-safety-with-ruby.html)
  - [http://m.onkey.org/thread-safety-for-your-rails](http://m.onkey.org/thread-safety-for-your-rails)
  - What is mean? does the variable share with multiple threads, Is it still safe ?
  - If we design write operations in a way that while they’re running, other threads can’t read nor alter the state we’re modifying, that change is thread safe.
  - You should care about the use for $vars, @@vars, instance variables at class level and constants.

## Thread
- http://phrogz.net/programmingruby/ref_c_thread.html
- http://phrogz.net/programmingruby/tut_threads.html
- http://www.linuxprogrammingblog.com/threads-and-fork-think-twice-before-using-them
- http://www.geekride.com/fork-forking-vs-threading-thread-linux-kernel/
- http://tenderlovemaking.com/2012/06/18/removing-config-threadsafe.html
- A thread shares all global, instance, and local variables that are in existence at the time the thread starts, local variables created within a thread's block are truly local to that thread—each thread will have its own copy of these variables.
- When a Ruby program terminates, all running threads are killed, regardless of their states
-  set abort_on_exception to true, and an unhandled exception kills all running threads.

