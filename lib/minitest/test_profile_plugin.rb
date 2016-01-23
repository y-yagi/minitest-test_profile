require "minitest/test_profile"
require "minitest/test_profile/reporter"

module Minitest
  def self.plugin_test_profile_init(opts)
    self.reporter << Minitest::TestProfile::Reporter.new($stdout, { count: Minitest::TestProfile.count })
  end
end
