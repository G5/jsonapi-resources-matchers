require 'spec_helper'

module JSONAPI::Resources::Matchers
  RSpec.describe CheckSerialization do

    context "given a resource without the primary_key set" do
      it "raises an error for the developer" do
        author = Author.new
        author_resource = AuthorResource.new(author, {})
        expect { described_class.(author_resource) }.to raise_error(
          ArgumentError,
          [
            "`name` is nil.",
            "In this scenario, jsonapi-resources does not",
            "include the attributes in order for this matcher to work.",
            "To get this working, initialize the model with",
            "a primary key set.",
          ].join(" ")
        )
      end
    end
    
  end
end
