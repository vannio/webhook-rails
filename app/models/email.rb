class Email < ApplicationRecord
	validates :address, :category, :event, :presence => true

  def self.calculate_rate(category, event)
    total = self.where(category: category).count
    event = self.where(event: event, category: category).count

    percentage = (event.to_f / total.to_f) * 100
    percentage.nan? ? 0 : percentage
  end
end
