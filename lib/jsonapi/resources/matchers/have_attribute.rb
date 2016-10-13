module JSONAPI
  module Resources
    module Matchers
      class HaveAttribute

        attr_accessor :name, :resource

        def initialize(name)
          self.name = name
        end

        def matches?(resource)
          self.resource = resource

          resource_class = resource.class

          serialized_hash = JSONAPI::ResourceSerializer.new(resource_class).
            serialize_to_hash(resource).with_indifferent_access
          expected_key = JSONAPI.configuration.key_formatter.format(name.to_s)
          attributes = serialized_hash["data"]["attributes"]
          return false if attributes.nil?
          attributes.has_key?(expected_key)
        end

        def failure_message
          resource_name = resource.class.name.demodulize
          %Q(expected #{resource_name} to have attribute #{name})
        end

        def description
          "have attribute #{name}"
        end

      end
    end
  end
end
