# http://stackoverflow.com/questions/4253694/simple-railtie-extension-of-active-record
# http://railscasts.com/episodes/301-extracting-a-ruby-gem?view=asciicast
# Our class has to inherit from Rails::Railtie and needs to call initializer. The initializer needs a unique name and its block is called when the Rails application starts up. We add functionality to ActiveRecord through ActiveSupport by calling ActiveSupport.on_load and the code inside the on_load block is executed in the scope of ActiveRecord::Base. By calling extend ModelAdditions in here we extend the module directly into ActiveRecord.
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
