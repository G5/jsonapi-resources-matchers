require 'spec_helper'

RSpec.describe JSONAPI::Resources::Matchers::Filter do

  describe "#description" do
    let(:filter) { described_class.new(:name) }
    subject(:description) { filter.description }
    it { is_expected.to eq "be able to filter by `name`"}
  end

end
