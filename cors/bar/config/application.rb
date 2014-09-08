require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bar
  class Application < Rails::Application
    config.middleware.insert_before "ActionDispatch::Static", "Rack::Cors" do
      allow do
        # origins 'http://foo.dev/' # [X]
        # origins 'http://foo.dev'  # [O]
        # origins 'foo.dev'         # [O]
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :options]
      end
    end
  end
end
