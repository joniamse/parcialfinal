class Rate < ApplicationRecord
	belongs_to :car
	has_many :payments

	def price_car
		a = []

		a.push(amount.to_s + " - "+ car.name)
	end
end
