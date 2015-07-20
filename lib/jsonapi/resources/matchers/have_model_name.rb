module JSONAPI
  module Resources
    module Matchers
      class HaveModelName

        attr_accessor :expected_model_name, :resource

        def initialize(name)
          self.expected_model_name = name
        end

        def matches?(resource)
          self.resource = resource
          self.resource.class._model_name.to_s == self.expected_model_name.to_s
        end

        def description
          %Q(have model name `#{expected_model_name}`)
        end

        def failure_message
          resource_name = resource.class.name.demodulize
          %Q(expected `#{resource_name}` to have the model name `#{expected_model_name}`)
        end

      end
    end
  end
end
