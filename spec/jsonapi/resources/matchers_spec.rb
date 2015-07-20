require 'spec_helper'

describe JSONAPI::Resources::Matchers do

  it 'has a version number' do
    expect(JSONAPI::Resources::Matchers::VERSION).not_to be nil
  end

  describe "resource matchers", type: :resource do
    describe "attributes" do
      let(:author) { Author.new }
      subject(:resource) { AuthorResource.new(author) }
      it { is_expected.to have_attribute(:name) }
      it { is_expected.to_not have_attribute(:created_at) }
    end

    describe "filters" do
      let(:author) { Author.new }
      subject(:resource) { AuthorResource.new(author) }
      it { is_expected.to filter(:name) }
      it { is_expected.to_not filter(:created_at) }
    end

    describe "have many" do
      let(:author) { Author.new }
      subject(:resource) { AuthorResource.new(author) }
      it { is_expected.to have_many(:books) }
      it { is_expected.to have_many(:libros).with_class_name("Book") }
      it { is_expected.to_not have_many(:fans) }
    end

    describe "model name" do
      let(:book) { Book.new }
      subject(:resource) { LibroResource.new(book) }
      it { is_expected.to have_model_name("Book") }
      it { is_expected.to_not have_model_name("Libro") }
    end
  end

end
