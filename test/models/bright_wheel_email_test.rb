require 'test_helper'

class BrightWheelEmailTest < ActiveSupport::TestCase
  should validate_presence_of(:to)
  should validate_presence_of(:to_name)
  should validate_presence_of(:from)
  should validate_presence_of(:from_name)
  should validate_presence_of(:subject)
  should validate_presence_of(:body)

  test 'should validate format of email' do
    
  end

  test 'should sanitize html before storing' do

  end

end
