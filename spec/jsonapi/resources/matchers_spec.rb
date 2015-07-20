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

  end

end
