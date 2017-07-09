require 'test_helper'

class EmailProviderTest < ActiveSupport::TestCase
  should validate_presence_of(:name)

  test 'should get active provider' do
     email_provider = create(:email_provider, active: true)
     assert_equal email_provider.id, EmailProvider.active_providers.first.id
  end

  test 'should raise error if no active provider found' do
    assert_raise(Exception) { EmailProvider.send_email({}) }
  end

  test 'should trigger Mailgun' do
    email_provider = create(:email_provider, name: "Mailgun", active: true)
    MailgunEmailProvider.expects(:deliver!).with({ to: 'Rishav Rastogi'})
    EmailProvider.send_email({ to: 'Rishav Rastogi'})
  end

  test 'should trigger Sendgrid' do
    email_provider = create(:email_provider, name: "Sendgrid", active: true)
    SendgridEmailProvider.expects(:deliver!).with({ to: 'Rishav Rastogi'})
    EmailProvider.send_email({ to: 'Rishav Rastogi'})
  end

end
