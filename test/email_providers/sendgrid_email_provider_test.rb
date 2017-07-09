require 'test_helper'

class SendgridEmailProviderTest < ActiveSupport::TestCase
  test 'mock request' do
    attributes = build(:bright_wheel_email).attributes.symbolize_keys
    formatted_attributes = SendgridEmailProvider.formatted_attributes(attributes)
    Curl::Easy.any_instance.expects(:http_post).with(formatted_attributes.to_json)
    SendgridEmailProvider.deliver!(attributes)
  end

  test 'formatted attributes' do
    attributes = build(:bright_wheel_email, to: 'rishav.rastogi@gmail.com', to_name: 'rishav rastogi', from: "test@example.com" ).attributes.symbolize_keys
    formatted_attributes = SendgridEmailProvider.formatted_attributes(attributes)
    assert_equal formatted_attributes[:personalizations].first[:to].first[:email], 'rishav.rastogi@gmail.com'
  end

end
