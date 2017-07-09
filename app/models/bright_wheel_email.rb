class BrightWheelEmail < ApplicationRecord
  HTML_TAG_WHITELIST = %w[a p div table th tr td img]

  validates :to, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates :to_name, presence: true
  validates :from, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates :from_name, presence: true
  validates :subject, presence: true
  validates :body, presence: true

  before_save :sanitize_body

  private

  def sanitize_body
    self.body = Sanitize.document(body, Sanitize::Config::RELAXED)
  end

end
