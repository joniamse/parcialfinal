class AddRateIdToPayment < ActiveRecord::Migration[6.0]
  def change
    add_reference :payments, :rate, null: false, foreign_key: true
  end
end
