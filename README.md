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
### rack list
- [http://guides.rubyonrails.org/rails_on_rack.html](http://guides.rubyonrails.org/rails_on_rack.html)
- [http://railscasts.com/episodes/151-rack-middleware](http://railscasts.com/episodes/151-rack-middleware)
- [http://pothibo.com/2013/11/ruby-on-rails-inside-actiondispatch-and-rack/](http://pothibo.com/2013/11/ruby-on-rails-inside-actiondispatch-and-rack/)

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
