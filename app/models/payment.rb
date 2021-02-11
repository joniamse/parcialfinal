class Payment < ApplicationRecord
	belongs_to :rate
	belongs_to :person

	def self.totalprice
		tp = 0

		for v in Payment.all
			tp = tp + v.rate.amount
		end
		tp
	end

	def self.filterfromto(from, to)  
        payments = []
        if (from == "" ) or (to == "")
            payments = Payment.all
        else
            from = from.to_date
            to = to.to_date
            for v in Payment.all
                condition = 0
                if (v.bill_date.to_date > from)
                    condition = condition + 1
                end

                if (v.bill_date.to_date < to)
                    condition = condition + 1
                end

                if (condition == 2)
                    payments.push(v)
                end
            end
            payments
        end

    end

    def self.filterambos(person,car)  # FILTRA POR PERSON Y CAR AL MISMO TIEMPO
        array = []

        person = person.downcase
        car = car.downcase

        for v in Payment.all
            ap = v.person.first_name.downcase
            ap1 = v.rate.car.name.downcase
            if ap.include?(person) and ap1.include?(car)
                array.push(v)       
            end
        end

        array

    end

    def self.filtercabin(cabin)  # FILTRA CABIN BUSQUEDA BLANDA
        a = []

        cabin = cabin.to_i

        for v in Payment.all
            ap = v.person.cabin.number
            if ap == cabin
                
                a.push(v)
            end
        end

        a

    end
end
