module JSONAPI::Resources::Matchers
  class CheckSerialization

    MESSAGE = [
      "`:primary_key` is nil.",
      "In this scenario, jsonapi-resources does not",
      "include the attributes in order for this matcher to work.",
      "To get this working, initialize the model with a primary key set.",
    ].join(" ")

    def self.call(resource)
      return true if resource.try(:id).present?
      fail(
        ArgumentError,
        MESSAGE.gsub(":primary_key", resource.class._primary_key.to_s)
      )
    end

  end
end
