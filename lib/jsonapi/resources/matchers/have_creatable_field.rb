module JSONAPI
  module Resources
    module Matchers
      class HaveCreatableField

        attr_accessor :name, :resource

        def initialize(name)
          self.name = name
        end

        def matches?(resource)
          self.resource = resource
          resource.class.creatable_fields(resource.context).include?(name)
        end

        def failure_message
          resource_name = resource.class.name.demodulize
          %Q(expected #{resource_name} to have creatable field `#{name}`)
        end

        def description
          "have creatable field `#{name}`"
        end

      end
    end
  end
end
