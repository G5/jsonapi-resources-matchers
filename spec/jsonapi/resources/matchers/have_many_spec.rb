require 'spec_helper'

RSpec.describe JSONAPI::Resources::Matchers::HaveMany do

  describe "#description" do
    let(:matcher) { described_class.new(:friends) }
    subject(:description) { matcher.description }
    it { is_expected.to eq "have many `friends`"}
  end

  describe "#failure_message" do
    let(:author) { Author.new }
    let(:resource) { AuthorResource.new(author) }
    let(:matcher) { described_class.new(:friends) }
    subject(:failure_message) { matcher.failure_message }

    before { matcher.resource = resource }

    it { is_expected.to eq "expected `AuthorResource` to have many `friends`"}

    context "with a class name" do
      before { matcher.expected_class_name = "Author" }
      specify do
        is_expected.to eq "expected `AuthorResource` to have many `friends` with class name `Author`"
      end
    end
  end

end
