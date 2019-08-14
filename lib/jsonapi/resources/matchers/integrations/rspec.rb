if defined?(RSpec)
  require 'rspec/core'
  RSpec.configure do |c|
    c.include JSONAPI::Resources::Matchers, type: :resource
  end
end
