require 'test_helper'

class MailgunEmailProviderTest < ActiveSupport::TestCase
  test 'mock request' do
    attributes = build(:bright_wheel_email).attributes.symbolize_keys
    formatted_attributes = MailgunEmailProvider.formatted_attributes(attributes)
    curl = mock()
    content_mock = mock()
    Curl::Easy.expects(:new).returns(curl)
    curl.expects(:http_auth_types=)
    curl.expects(:username=)
    curl.expects(:password=)
    Curl::PostField.expects(:content).with('to', formatted_attributes[:to]).returns(content_mock)
    Curl::PostField.expects(:content).with('from', formatted_attributes[:from]).returns(content_mock)
    Curl::PostField.expects(:content).with('subject', formatted_attributes[:subject]).returns(content_mock)
    Curl::PostField.expects(:content).with('html', formatted_attributes[:html]).returns(content_mock)
    curl.expects(:http_post).with(content_mock, content_mock, content_mock, content_mock)
    MailgunEmailProvider.deliver!(attributes)
  end

  test 'formatted attributes' do
    attributes = build(:bright_wheel_email, to: 'rishav.rastogi@gmail.com', to_name: 'rishav rastogi', from: "test@example.com" ).attributes.symbolize_keys
    formatted_attributes = MailgunEmailProvider.formatted_attributes(attributes)
    assert_equal formatted_attributes[:to], 'rishav rastogi <rishav.rastogi@gmail.com>'
  end


end
