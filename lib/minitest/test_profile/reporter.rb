module Minitest
  module TestProfile
    class Reporter < StatisticsReporter
      attr_reader :test_results

      def initialize(io = $stdout, options = {})
        super(io, options)
        @test_results = []
        @count = options[:count].to_i
        @calculated_total_time = nil
      end

      def report
        display_aggregated_results
      end

      def record(result)
        @test_results << result
      end

      def display_aggregated_results
        calculate_total_time
        aggregate_slow_tests!
        io.puts "\nTop %d slowest tests (%.6f seconds, %.1f%% of total time):\n" % [@test_results.size, slow_tests_total_time, ratio]
        @test_results.each do |test_result|
          io.puts "%s\n  %.2f seconds\n" % [test_result.location, test_result.time]
        end
      end

      def calculate_total_time
        @calculated_total_time ||= @test_results.inject(0) { |sum, slow_test| sum + slow_test.time }
      end

      def aggregate_slow_tests!
        @test_results.sort! { |a, b|  b.time <=> a.time }
        @test_results = @test_results.take(@count)
      end

      def slow_tests_total_time
        @slow_tests_total_time ||= @test_results.inject(0) { |sum, slow_test| sum + slow_test.time }
      end

      def ratio
        (slow_tests_total_time / @calculated_total_time) * 100
      end
    end
  end
end
