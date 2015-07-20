module JSONAPI
  module Resources
    module Matchers
      class HaveMany

        attr_accessor :name, :resource, :expected_class_name

        def initialize(name)
          self.name = name
        end

        def description
          "have many `#{name}`"
        end

        def matches?(resource)
          self.resource = resource

          has_key_in_relationships? && matches_class_name?
        end

        def has_key_in_relationships?
          serialized_hash = JSONAPI::ResourceSerializer.new(resource.class).
            serialize_to_hash(resource).with_indifferent_access
          expected_key = name.to_s.dasherize
          relationships = serialized_hash["data"]["relationships"]
          return false if relationships.nil?
          relationships.has_key?(expected_key)
        end

        def with_class_name(name)
          self.expected_class_name = name
          self
        end

        def failure_message
          resource_name = resource.class.name.demodulize
          message = ["expected `#{resource_name}` to have many `#{name}`"]
          if self.expected_class_name
            message << "with class name `#{self.expected_class_name}`"
          end
          message.join(" ")
        end

        def matches_class_name?
          return true if self.expected_class_name.nil?
          association = resource.class._relationships[name]
          actual_class_name = association.class_name
          self.expected_class_name == actual_class_name
        end

      end
    end
  end
end
