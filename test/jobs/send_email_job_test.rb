require 'test_helper'

class SendEmailJobTest < ActiveJob::TestCase

  test 'should trigger email' do
    bw_email = create(:bright_wheel_email)
    EmailProvider.expects(:send_email).with(bw_email.mailable_attributes)
    SendEmailJob.perform_now(bw_email.id)
  end

end
