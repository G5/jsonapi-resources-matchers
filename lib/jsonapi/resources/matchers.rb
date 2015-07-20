require "jsonapi/resources/matchers/version"
require "jsonapi/resources/matchers/have_attribute"
require "jsonapi/resources/matchers/filter"
require "jsonapi/resources/matchers/have_many"

module JSONAPI
  module Resources
    module Matchers

      def have_attribute(name)
        HaveAttribute.new(name)
      end

      def filter(name)
        Filter.new(name)
      end

      def have_many(name)
        HaveMany.new(name)
      end

    end
  end
end

require "jsonapi/resources/matchers/integrations/rspec"
