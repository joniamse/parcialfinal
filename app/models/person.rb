class Person < ApplicationRecord
	has_many :payments
	belongs_to :cabin

	validate :validacion

	def validacion
		for v in Person.all 
			if self.cabin_id.to_i == v.cabin.id.to_i
				errors.add(:cabin_id, "| Solo puede haber un cajero en una cabina")
			end
		end
	end
end
