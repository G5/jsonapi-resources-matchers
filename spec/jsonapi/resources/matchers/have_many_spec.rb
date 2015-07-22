require 'spec_helper'

RSpec.describe JSONAPI::Resources::Matchers::HaveMany do

  describe "#description" do
    context "relationship type is `:have_many`" do
      let(:matcher) { described_class.new(:have_many, :friends) }
      subject(:description) { matcher.description }
      it { is_expected.to eq "have many `friends`"}
    end

    context "relationship type is `:have_one`" do
      let(:matcher) { described_class.new(:have_one, :friend) }
      subject(:description) { matcher.description }
      it { is_expected.to eq "have one `friend`"}
    end
  end

  describe "#failure_message" do
    let(:author) { Author.new }
    let(:resource) { AuthorResource.new(author) }
    let(:matcher) { described_class.new(:have_many, :friends) }
    subject(:failure_message) { matcher.failure_message }

    before { matcher.resource = resource }

    context "relationship type is `:have_many`" do
      let(:matcher) { described_class.new(:have_many, :friends) }
      it { is_expected.to eq "expected `AuthorResource` to have many `friends`"}
    end

    context "relationship type is `:have_one`" do
      let(:matcher) { described_class.new(:have_one, :friend) }
      it { is_expected.to eq "expected `AuthorResource` to have one `friend`"}
    end

    context "with a class name" do
      before { matcher.expected_class_name = "Author" }
      specify do
        is_expected.to eq "expected `AuthorResource` to have many `friends` with class name `Author`"
      end
    end

    context "with a relation name" do
      it "generates the right failure message" do
        matcher.with_relation_name(:people)
        is_expected.to eq "expected `AuthorResource` to have many `friends` with relation name `people`"
      end

      it "checks that the relation name matches" do
        matcher = described_class.new(:have_many, :libros)

        matcher.with_relation_name(:bookers)
        expect(matcher.matches?(resource)).to be false

        matcher.with_relation_name(:books)
        expect(matcher.matches?(resource)).to be true
      end
    end
  end

end
