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

          has_key_in_relationships? &&
            matches_class_name? &&
            matches_relation_name?
        end

        def has_key_in_relationships?
          serialized_hash = JSONAPI::ResourceSerializer.new(resource.class).
            serialize_to_hash(resource).with_indifferent_access
          expected_key = JSONAPI.configuration.key_formatter.format(name.to_s)
          relationships = serialized_hash["data"]["relationships"]
          return false if relationships.nil?
          relationships.has_key?(expected_key)
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
