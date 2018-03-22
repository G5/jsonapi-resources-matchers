module JSONAPI
  module Resources
    module Matchers
      class Relationship

        attr_accessor(:name,
                      :relationship_type,
                      :resource,
                      :expected_class_name,
                      :expected_relation_name)

        def initialize(relationship_type, name)
          self.relationship_type = relationship_type
          self.name = name
        end

        def description
          "#{humanized_relationship_type} `#{name}`"
        end

        def humanized_relationship_type
          relationship_type.to_s.gsub('_',' ')
        end

        def matches?(resource)
          self.resource = resource

          is_serializable? &&
          has_key_in_relationships? &&
            matches_class_name? &&
            matches_relation_name?
        end

        def is_serializable?
          CheckSerialization.(self.resource)
        end

        def has_key_in_relationships?
          relationships = resource.class._relationships
          return false if relationships.nil?

          formatter = JSONAPI.configuration.key_formatter

          expected_key = formatter.format(name.to_s)
          relationship_keys = relationships.keys.map do |key|
            formatter.format(key.to_s)
          end

          relationship_keys.include?(expected_key)
        end

        def with_class_name(name)
          self.expected_class_name = name
          self
        end

        def with_relation_name(name)
          self.expected_relation_name = name
          self
        end

        def failure_message
          resource_name = resource.class.name.demodulize
          message = ["expected `#{resource_name}` to #{humanized_relationship_type} `#{name}`"]
          if self.expected_class_name
            message << "with class name `#{self.expected_class_name}`"
          end
          if self.expected_relation_name
            message << "with relation name `#{self.expected_relation_name}`"
          end
          message.join(" ")
        end

        def matches_class_name?
          return true if self.expected_class_name.nil?
          association = resource.class._relationships[name]
          actual_class_name = association.class_name
          self.expected_class_name == actual_class_name
        end

        def matches_relation_name?
          return true if self.expected_relation_name.nil?
          association = resource.class._relationships[name]
          actual_relation_name = association.relation_name({})
          self.expected_relation_name == actual_relation_name
        end

      end
    end
  end
end
