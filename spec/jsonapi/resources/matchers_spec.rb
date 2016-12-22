require 'spec_helper'

describe JSONAPI::Resources::Matchers do

  it 'has a version number' do
    expect(JSONAPI::Resources::Matchers::VERSION).not_to be nil
  end

  describe "resource matchers", type: :resource do
    describe "attributes" do
      let(:author) { Author.new }
      subject(:resource) { AuthorResource.new(author, {}) }
      it { is_expected.to have_attribute(:name) }
      it { is_expected.to_not have_attribute(:created_at) }
    end

    describe "sortable fields" do
      let(:author) { Author.new }
      subject(:resource) { AuthorResource.new(author, {}) }
      it { is_expected.to have_sortable_field(:name) }
      it { is_expected.to_not have_sortable_field(:created_at) }
    end

    describe "creatable fields" do
      let(:author) { Author.new }
      subject(:resource) { AuthorResource.new(author, {}) }
      it { is_expected.to have_creatable_field(:name) }
      it { is_expected.to_not have_creatable_field(:created_at) }
    end

    describe "updatable fields" do
      let(:author) { Author.new }
      subject(:resource) { AuthorResource.new(author, {}) }
      it { is_expected.to have_updatable_field(:name) }
      it { is_expected.to_not have_updatable_field(:created_at) }
    end

    describe "filters" do
      let(:author) { Author.new }
      subject(:resource) { AuthorResource.new(author, {}) }
      it { is_expected.to filter(:name) }
      it { is_expected.to_not filter(:created_at) }
    end

    describe "have many" do
      let(:author) { Author.new }
      subject(:resource) { AuthorResource.new(author, {}) }
      it { is_expected.to have_many(:books) }
      it { is_expected.to have_many(:libros).with_class_name("Book") }
      it { is_expected.to have_many(:libros).with_relation_name(:books) }
      it { is_expected.to_not have_many(:fans) }
    end

    describe "have one" do
      let(:book) { Book.new }
      subject(:resource) { LibroResource.new(book, {}) }
      it { is_expected.to have_one(:author) }
      it { is_expected.to have_one(:author).with_class_name("Writer") }
      it { is_expected.to have_one(:author).with_relation_name(:writer) }
    end

    describe "model name" do
      let(:book) { Book.new }
      subject(:resource) { LibroResource.new(book, {}) }
      it { is_expected.to have_model_name("Book") }
      it { is_expected.to_not have_model_name("Libro") }
    end

    describe "primary key" do
      let(:author) { Author.new }
      subject(:resource) { AuthorResource.new(author, {}) }
      it { is_expected.to have_primary_key(:name) }
      it { is_expected.to_not have_primary_key(:id) }
    end
  end

end
