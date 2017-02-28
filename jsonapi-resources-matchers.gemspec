# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jsonapi/resources/matchers/version'

Gem::Specification.new do |spec|
  spec.name          = "jsonapi-resources-matchers"
  spec.version       = JSONAPI::Resources::Matchers::VERSION
  spec.authors       = ["G5", "Ramon Tayag"]
  spec.email         = ["lateam@getg5.com","ramon.tayag@gmail.com"]

  spec.summary       = %q{Spec matchers for jsonapi-resources}
  spec.description   = %q{Spec matchers for jsonapi-resources}
  spec.homepage      = "https://github.com/G5/jsonapi-resources-matchers"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "jsonapi-resources", ">= 0.9.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rails", "~> 4.0"
end
