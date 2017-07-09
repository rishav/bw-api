require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'support/factory_girl'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  include FactoryGirl::Syntax::Methods
  # Add more helper methods to be used by all tests here...
end
