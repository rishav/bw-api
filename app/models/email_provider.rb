class EmailProvider < ApplicationRecord
  validates_presence_of :name
  scope :active_providers, -> { where(status: true) }
end
