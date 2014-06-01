module GemFoo
  class Railtie < Rails::Railtie
    initializer "gem_foo.middleware" do
      config.app_middleware.use 'GemFoo::DummyMiddleware'
    end
  end
end
