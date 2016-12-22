module JSONAPI
  module Resources
    module Matchers
      class HaveSortableField

        attr_accessor :name, :resource

        def initialize(name)
          self.name = name
        end

        def matches?(resource)
          self.resource = resource
          resource.class.sortable_fields(resource.context).include?(name)
        end

        def failure_message
          resource_name = resource.class.name.demodulize
          %Q(expected #{resource_name} to have sortable field `#{name}`)
        end

        def failure_message_when_negated
          resource_name = resource.class.name.demodulize
          %Q(expected #{resource_name} not to have sortable field `#{name}`)
        end

        def description
          "have sortable field `#{name}`"
        end

      end
    end
  end
end
