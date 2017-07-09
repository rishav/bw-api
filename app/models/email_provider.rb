class EmailProvider < ApplicationRecord
  validates_presence_of :name
  scope :active_providers, -> { where(active: true) }

  def self.send_email(attributes)
    active_email_provider = active_providers.first
    if active_email_provider.nil?
      raise Exception, "No active email provider found"
    end

    if active_email_provider.name == "Mailgun"
      MailgunEmailProvider.deliver!(attributes)
    end

    if active_email_provider.name == "Sendgrid"
      SendgridEmailProvider.deliver!(attributes)
    end
  end

end
