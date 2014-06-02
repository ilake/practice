module GemFoo
  class Railtie < Rails::Railtie
    initializer "gem_foo.middleware" do
      config.app_middleware.use 'GemFoo::DummyMiddleware'
    end

    initializer "gem_foo.uuid_middleware" do
      config.app_middleware.use 'GemFoo::UuidMiddleware'
    end

    initializer 'gem_foo.model_additions' do
      ActiveSupport.on_load :active_record do
        include GemFoo::Uuid
      end
    end
  end
end
