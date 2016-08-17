class Email < ApplicationRecord
	validates :address, :category, :event, :presence => true
end
