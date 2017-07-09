require 'test_helper'

class MailgunEmailProviderTest < ActiveSupport::TestCase
  test 'mock request' do
    attributes = { to: ' Rishav Rastogi <rishav.rastogi@gmail.com>' , from: 'Mailgun Sandbox <postmaster@sandboxa777ba7070f0423087c3f392065f30fc.mailgun.org>' , body: '<html><body> <b> HTML TEST </b></html>', subject: 'Hello HTML'}
    curl = mock()
    content_mock = mock()
    Curl::Easy.expects(:new).returns(curl)
    curl.expects(:http_auth_types=)
    curl.expects(:username=)
    curl.expects(:password=)
    Curl::PostField.expects(:content).with('to', attributes[:to]).returns(content_mock)
    Curl::PostField.expects(:content).with('from', attributes[:from]).returns(content_mock)
    Curl::PostField.expects(:content).with('subject', attributes[:subject]).returns(content_mock)
    Curl::PostField.expects(:content).with('html', attributes[:body]).returns(content_mock)
    curl.expects(:http_post).with(content_mock, content_mock, content_mock, content_mock)
    MailgunEmailProvider.deliver!(attributes)
  end
end
