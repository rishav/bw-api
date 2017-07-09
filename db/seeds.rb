["Mailgun", "Sendgrid"].each do |mail_provider_name|
  EmailProvider.create(name: mail_provider_name)
end

EmailProvider.all.first.update(active: true)
