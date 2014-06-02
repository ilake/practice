require 'gem_foo/uuid'

module GemFoo
  class UuidMiddleware
    extend Uuid::ClassMethods

    def initialize(app)
      @app = app
    end

    def call(env)
      self.class.assign_uuid do
        result = @app.call(env)
      end
    end
  end
end
