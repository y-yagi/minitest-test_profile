require 'test_helper'

class Minitest::TestProfileTest < Minitest::Test
  attr_accessor :reporter, :output

  def setup
    @output = StringIO.new('')
  end

  def test_display_profile
    Minitest::TestProfile.use!
    reporter = Minitest::TestProfile::Reporter.new(@output, { count: 10 })
    reporter.start
    reporter.record(SampleTest.new(:test_normal).run)
    reporter.record(SampleTest.new(:test_slow).run)
    reporter.record(SampleTest.new(:test_more_slow).run)
    reporter.report

    expect = <<-EOS
SampleTest#test_more_slow
  0.30 seconds
SampleTest#test_slow
  0.10 seconds
SampleTest#test_normal
  0.00 seconds
    EOS

    assert_match 'Top 3 slowest tests', @output.string
    assert_match expect, @output.string
  end

  def test_specify_the_count
    Minitest::TestProfile.use!
    reporter = Minitest::TestProfile::Reporter.new(@output, { count: 1 })
    reporter.start
    reporter.record(SampleTest.new(:test_normal).run)
    reporter.record(SampleTest.new(:test_slow).run)
    reporter.record(SampleTest.new(:test_more_slow).run)
    reporter.report

    expect = <<-EOS
SampleTest#test_more_slow
  0.30 seconds
    EOS

    assert_match 'Top 1 slowest tests', @output.string
    assert_match expect, @output.string
    refute_match 'SampleTest#test_slow', @output.string
    refute_match 'SampleTest#test_normal', @output.string
  end
end

class SampleTest < Minitest::Test
  def test_normal
  end

  def test_slow
    sleep 0.1
  end

  def test_more_slow
    sleep 0.3
  end
end

