require 'spec_helper'

RSpec.describe JSONAPI::Resources::Matchers::HaveModelName do

  describe "#description" do
    let(:matcher) { described_class.new("Friend") }
    subject(:description) { matcher.description }
    it { is_expected.to eq "have model name `Friend`"}
  end

  describe "#failure_message" do
    let(:author) { Author.new }
    let(:resource) { AuthorResource.new(author) }
    let(:matcher) { described_class.new("Friend") }
    subject(:failure_message) { matcher.failure_message }

    before { matcher.resource = resource }

    it { is_expected.to eq "expected `AuthorResource` to have the model name `Friend`"}
  end

end
