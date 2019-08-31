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
          CheckSerialization.(self.resource)

          resource_class = resource.class

          attributes = resource.fetchable_fields
          return false if attributes.blank?

          formatter = JSONAPI.configuration.key_formatter

          expected_key = formatter.format(name.to_s)
          formatted_attributes = attributes.map do |attribute|
            formatter.format(attribute.to_s)
          end

          formatted_attributes.include?(expected_key)
        end

        def failure_message
          resource_name = resource.class.name.demodulize
          %Q(expected #{resource_name} to have attribute #{name})
        end
        
        def failure_message_when_negated
          resource_name = resource.class.name.demodulize
          %Q(expected #{resource_name} to not have attribute #{name}, but it was present)
        end

        def description
          "have attribute #{name}"
        end
      end
    end
  end
end
