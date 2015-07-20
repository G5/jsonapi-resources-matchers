module JSONAPI
  module Resources
    module Matchers
      class HavePrimaryKey

        attr_accessor :expected_primary_key, :resource

        def initialize(name)
          self.expected_primary_key = name
        end

        def description
          "have primary key `#{self.expected_primary_key}`"
        end

        def matches?(resource)
          self.resource = resource
          self.resource.class._primary_key.to_s ==
            self.expected_primary_key.to_s
        end

        def failure_message
          resource_name = resource.class.name.demodulize
          %Q(expected `#{resource_name}` to use primary key `#{self.expected_primary_key}`)
        end

      end
    end
  end
end
