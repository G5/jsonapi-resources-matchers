module JSONAPI
  module Resources
    module Matchers
      class HaveUpdatableField

        attr_accessor :name, :resource

        def initialize(name)
          self.name = name
        end

        def matches?(resource)
          self.resource = resource
          resource.class.updatable_fields(resource.context).include?(name)
        end

        def failure_message
          resource_name = resource.class.name.demodulize
          %Q(expected #{resource_name} to have updatable field `#{name}`)
        end

        def failure_message_when_negated
          resource_name = resource.class.name.demodulize
          %Q(expected #{resource_name} not to have updatable field `#{name}`)
        end

        def description
          "have updatable field `#{name}`"
        end

      end
    end
  end
end
