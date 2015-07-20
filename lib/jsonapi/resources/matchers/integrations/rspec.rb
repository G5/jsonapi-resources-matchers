if defined?(RSpec)
  RSpec.configure do |c|
    c.include JSONAPI::Resources::Matchers, type: :resource
  end
end
