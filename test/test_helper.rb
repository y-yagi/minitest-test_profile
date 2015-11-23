require 'coveralls'
Coveralls.wear!

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'pry'
require 'minitest/test_profile'
require 'minitest/autorun'
