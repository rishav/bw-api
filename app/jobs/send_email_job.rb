class SendEmailJob < ApplicationJob
  queue_as :mailers

  def perform(email_id)
    bright_wheel_email = BrightWheelEmail.find(email_id)
    EmailProvider.send_email(bright_wheel_email.mailable_attributes)
  end
end
