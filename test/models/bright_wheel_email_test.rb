require 'test_helper'

class BrightWheelEmailTest < ActiveSupport::TestCase
  should validate_presence_of(:to)
  should validate_presence_of(:to_name)
  should validate_presence_of(:from)
  should validate_presence_of(:from_name)
  should validate_presence_of(:subject)
  should validate_presence_of(:body)

  test 'should validate format of to email' do
    bw_email = build(:bright_wheel_email, to: 'rishav')
    refute bw_email.valid?

    bw_email = build(:bright_wheel_email, to: 'rishav.rastogi@gmail.com')
    assert bw_email.valid?
  end

  test 'should validate format of from email' do
    bw_email = build(:bright_wheel_email, from: 'rishav')
    refute bw_email.valid?

    bw_email = build(:bright_wheel_email, from: 'rishav.rastogi@gmail.com')
    assert bw_email.valid?
  end

  test 'should sanitize html before storing' do
    # testing to see if it removes the script tag
    bw_email = create(:bright_wheel_email)
    assert bw_email.body.index('<script>').nil?
  end


end
