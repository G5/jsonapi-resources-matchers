require 'spec_helper'

RSpec.describe JSONAPI::Resources::Matchers::HaveOne do

  describe "#description" do
    let(:matcher) { described_class.new(:author) }
    subject(:description) { matcher.description }
    it { is_expected.to eq "have one `author`"}
  end

  describe "#failure_message" do
    let(:book) { Book.new }
    let(:resource) { LibroResource.new(book) }
    let(:matcher) { described_class.new(:author) }
    subject(:failure_message) { matcher.failure_message }

    before { matcher.resource = resource }

    it { is_expected.to eq "expected `LibroResource` to have one `author`"}

    context "with a class name" do
      before { matcher.expected_class_name = "Author" }
      specify do
        is_expected.to eq "expected `LibroResource` to have one `author` with class name `Author`"
      end
    end
  end

end
