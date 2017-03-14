module JSONAPI
  module Resources
    module Matchers
      class HaveCreatableField

        attr_accessor :names, :resource

        def initialize(*names)
          self.names = [names].flatten
        end

        def matches?(resource)
          self.resource = resource
          self.names.to_set.subset?(creatable_fields.to_set)
        end

        def does_not_match?(resource)
          self.resource = resource
          (self.creatable_fields.to_set & self.names.to_set).empty?
        end

        def failure_message
          resource_name = resource.class.name.demodulize
          missing_fields = names - creatable_fields
          %Q(expected #{resource_name} to have creatable fields: #{missing_fields.join(", ")})
        end

        def failure_message_when_negated
          resource_name = resource.class.name.demodulize
          unexpected_fields = names.to_set & creatable_fields.to_set
          %Q(expected #{resource_name} to not have creatable fields: #{unexpected_fields.to_a.join(", ")})
        end

        def creatable_fields
          resource.class.creatable_fields(resource.context)
        end

        def description
          "has creatable fields: #{names.join(", ")}"
        end

      end
    end
  end
end
