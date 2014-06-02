module GemFoo
  module Uuid
    def self.included(base)
      base.extend ClassMethods
      base.before_validation do
        self.uuid = self.fetch_identifier if respond_to?(:uuid)
      end
    end

    def fetch_identifier
      self.class.fetch_identifier
    end

    module ClassMethods
      def assign_uuid
        clear_identifier
        context_hash[:identifier] = generate_identifier

        result = yield
        result
      end

      def context_hash
        Thread.current[:context] ||= {}
      end

      def generate_identifier
        @identifier = SecureRandom.uuid
      end

      def fetch_identifier
        context_hash[:identifier]
      end

      def clear_identifier
        Thread.current[:context] = {}
      end
    end

  end
end
