class MailgunEmailProvider
  API_KEY = 'key-dbb1491132ed334586717263b30dcd45'.freeze
  URL = 'https://api.mailgun.net/v3/sandboxa777ba7070f0423087c3f392065f30fc.mailgun.org/messages'.freeze

  def self.deliver!(attributes)
    curl = Curl::Easy.new(URL)
    curl.http_auth_types = :basic
    curl.username = 'api'
    curl.password = API_KEY
    curl.http_post(Curl::PostField.content('to', attributes[:to]), Curl::PostField.content('from', attributes[:from]), Curl::PostField.content('subject', attributes[:subject]), Curl::PostField.content('html', attributes[:body]))
  end

end
