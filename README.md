# Minitest::TestProfile

Show slow test as rspec profile options.

[![Build Status](https://travis-ci.org/y-yagi/minitest-test_profile.svg?branch=master)](https://travis-ci.org/y-yagi/minitest-test_profile)
[![Gem Version](https://badge.fury.io/rb/minitest-test_profile.svg)](http://badge.fury.io/rb/minitest-test_profile)
[![Code Climate](https://codeclimate.com/github/y-yagi/minitest-test_profile/badges/gpa.svg)](https://codeclimate.com/github/y-yagi/minitest-test_profile)
[![Coverage Status](https://coveralls.io/repos/y-yagi/minitest-test_profile/badge.svg?branch=master&service=github)](https://coveralls.io/github/y-yagi/minitest-test_profile?branch=master)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'minitest-test_profile'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install minitest-test_profile

## Usage

In your `test_helper.rb` file, add the following lines:

```ruby
require 'minitest/test_profile'
Minitest::TestProfile.use!
```

Options can be specified to `use!` method. Can specify options are as follows:

```ruby
Minitest::TestProfile.use!(
  count:  3  # The number of tests to be displayed. The default is 10.
)
```

## Output Example

```console
Top 10 slowest tests (13.062766 seconds, 78.9% of total time):
SearchIntegrationTest#test_can_search_places_that_login_user_created
  11.32 seconds
UserIntegrationTest#test_destroy_user
  0.30 seconds
IndexControllerTest#test_logout_top_page
  0.27 seconds
TravelIntegrationTest#test_add_route
  0.19 seconds
UserTest#test_authenticate_by_google_user
  0.18 seconds
TravelIntegrationTest#test_add_members_link_is_displayed
  0.18 seconds
TermsControllerTest#test_term_page
  0.17 seconds
TravelIntegrationTest#test_edit_schedule
  0.16 seconds
PlaceIntegrationTest#test_archive_place
  0.15 seconds
PlaceIntegrationTest#test_create_place_that_regist_by_form
  0.14 seconds
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/y-yagi/minitest-test_profile. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
