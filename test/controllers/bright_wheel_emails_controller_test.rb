require 'test_helper'

class BrightWheelEmailsControllerTest < ActionDispatch::IntegrationTest
  test "should not create with invalid params" do
    post post_email_url, params: build(:bright_wheel_email, to: nil).attributes
    json_response = JSON.parse(response.body)
    assert_response :unprocessable_entity
    refute json_response['errors']['to'].nil?
  end

  test "should create email record with valid params" do
    assert_difference 'BrightWheelEmail.count' do
      post post_email_url, params: build(:bright_wheel_email).attributes
      json_response = JSON.parse(response.body)
      assert_response :ok
      refute json_response['bright_wheel_email'].nil?
    end
  end

end
