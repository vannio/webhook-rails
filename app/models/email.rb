class Email < ApplicationRecord
	validates :address, :email_type, :event, :presence => true
  validates :address, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  TYPES = [
    "Order",
    "UserConfirmation",
    "Shipment",
    "ReferAFriend",
    "GetABookDiscount",
  ].freeze

  def self.calculate_rate(email_type, event)
    total = self.where(email_type: email_type).count
    event = self.where(event: event, email_type: email_type).count

    percentage = (event.to_f / total.to_f) * 100
    percentage.nan? ? 0 : percentage
  end
end
