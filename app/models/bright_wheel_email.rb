class BrightWheelEmail < ApplicationRecord
  HTML_TAG_WHITELIST = %w[a p div table th tr td img]

  validates :to, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates :to_name, presence: true
  validates :from, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates :from_name, presence: true
  validates :subject, presence: true
  validates :body, presence: true

  before_save :sanitize_body

  after_commit :send_email

  def mailable_attributes
    {to: to, to_name: to_name, from: from, from_name: from_name, subject: subject, body: body}
  end

  private

  def sanitize_body
    self.body = Sanitize.document(body, Sanitize::Config::RELAXED)
  end

  def send_email
    EmailProvider.send_email(mailable_attributes)
  end

end
