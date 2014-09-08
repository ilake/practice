# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application
class BarMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call env
    headers["bar-header"] = 'bar'
    [status, headers, body]
  end
end

use BarMiddleware
