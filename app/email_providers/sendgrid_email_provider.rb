class SendgridEmailProvider
  URL = 'https://api.sendgrid.com/v3/mail/send'.freeze
  API_KEY = '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' #ENV['SENDGRID_API_KEY']

  def self.deliver!(attributes)
    curl = Curl::Easy.new(URL)
    curl.headers['Content-Type'] = 'application/json'
    curl.headers['Authorization'] = "Bearer #{API_KEY}"
    curl.http_post(formatted_attributes(attributes).to_json)
    return curl.body_str
  end

  def self.formatted_attributes(attributes)
    formatted_attributes = {}
    formatted_attributes[:personalizations] = []
    to = {to: [ email: attributes[:to], name: attributes[:to_name]]}
    formatted_attributes[:personalizations] << to
    formatted_attributes[:from] = {email: attributes[:from], name: attributes[:from_name]}
    formatted_attributes[:subject] = attributes[:subject]
    formatted_attributes[:content] = [{ type: 'text/html', value: attributes[:body]}]
    return formatted_attributes
  end
  
end
