module JSONAPI
  module Resources
    module Matchers
      class HaveUpdatableField

        attr_accessor :names, :resource

        def initialize(*names)
          self.names = [names].flatten
        end

        def matches?(resource)
          self.resource = resource
          self.names.to_set.subset?(updatable_fields.to_set)
        end

        def does_not_match?(resource)
          self.resource = resource
          (self.updatable_fields.to_set & self.names.to_set).empty?
        end

        def failure_message
          resource_name = resource.class.name.demodulize
          missing_fields = names - updatable_fields
          %Q(expected #{resource_name} to have updatable fields: #{missing_fields.join(", ")})
        end

        def failure_message_when_negated
          resource_name = resource.class.name.demodulize
          unexpected_fields = names.to_set & updatable_fields.to_set
          %Q(expected #{resource_name} to not have updatable fields: #{unexpected_fields.to_a.join(", ")})
        end

        def updatable_fields
          resource.class.updatable_fields(resource.context)
        end

        def description
          "has updatable fields: #{names.join(", ")}"
        end

      end
    end
  end
end
