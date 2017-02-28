require 'spec_helper'

module JSONAPI::Resources::Matchers
  RSpec.describe HaveAttribute do

    describe "without an id set" do
      let(:book) { Book.new }
      subject(:resource) { LibroResource.new(book, {}) }

      it "raises an error" do
        expect {
          described_class.new(:id).matches?(resource)
        }.to raise_error(
          ArgumentError,
          CheckSerialization::MESSAGE.gsub(":primary_key", "id")
        )
      end
    end

  end
end
