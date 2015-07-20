require "jsonapi/resources/matchers/version"
require "jsonapi/resources/matchers/have_attribute"

module JSONAPI
  module Resources
    module Matchers

      def have_attribute(name)
        HaveAttribute.new(name)
      end

    end
  end
end

require "jsonapi/resources/matchers/integrations/rspec"
