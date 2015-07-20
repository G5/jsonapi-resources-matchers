module JSONAPI
  module Resources
    module Matchers
      class Filter

        attr_accessor :expected_filter_name, :resource

        def initialize(name)
          self.expected_filter_name = name
        end

        def matches?(resource)
          self.resource = resource
          self.resource.class._allowed_filters.keys.
            include?(self.expected_filter_name)
        end

        def description
          "be able to filter by `#{expected_filter_name}`"
        end

        def failure_message
          resource_name = resource.class.name.demodulize
          %Q(expected #{resource_name} to be able to filter #{expected_filter_name})
        end

      end
    end
  end
end
