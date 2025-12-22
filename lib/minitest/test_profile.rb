require 'minitest'
require "minitest/test_profile/version"
require "minitest/test_profile/reporter"

module Minitest
  module TestProfile
    class << self
      attr_reader :count
      def use!(count: 10)
        @count = count
        @use = true
      end

      def use?
        defined?(@use)
      end
    end
  end
end

Minitest.load(:test_profile) if Minitest.respond_to?(:load)
