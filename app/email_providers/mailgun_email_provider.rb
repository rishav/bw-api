class MailgunEmailProvider
  API_KEY = ENV['MAILGUN_API_KEY']
  URL = 'https://api.mailgun.net/v3/sandboxa777ba7070f0423087c3f392065f30fc.mailgun.org/messages'.freeze

  def self.deliver!(attributes)
    formatted_attributes = formatted_attributes(attributes)
    curl = Curl::Easy.new(URL)
    curl.http_auth_types = :basic
    curl.username = 'api'
    curl.password = API_KEY
    curl.http_post(Curl::PostField.content('to', formatted_attributes[:to]), Curl::PostField.content('from', formatted_attributes[:from]), Curl::PostField.content('subject', formatted_attributes[:subject]), Curl::PostField.content('html', formatted_attributes[:html]))
  end

  def self.formatted_attributes(attributes)
    formatted_attributes = {}
    formatted_attributes[:to] = "#{attributes[:to_name]} <#{attributes[:to]}>"
    formatted_attributes[:from] = "#{attributes[:from_name]} <#{attributes[:from]}>"
    formatted_attributes[:subject] = attributes[:subject]
    formatted_attributes[:html] = attributes[:body]
    formatted_attributes
  end

end
