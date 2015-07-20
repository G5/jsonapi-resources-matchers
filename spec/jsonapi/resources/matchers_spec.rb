require 'spec_helper'

describe Jsonapi::Resources::Matchers do
  it 'has a version number' do
    expect(Jsonapi::Resources::Matchers::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
