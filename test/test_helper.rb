ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "pry-rescue/minitest"
require "minitest/rails/capybara"
require "minitest/pride"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

def signin_user(user=:author)
  visit new_session_path
  fill_in "Email", with: users(user).email
  fill_in "Password", with: 'password'
  click_link_or_button "Sign in"
end
