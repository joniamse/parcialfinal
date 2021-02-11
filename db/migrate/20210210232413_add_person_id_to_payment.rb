class AddPersonIdToPayment < ActiveRecord::Migration[6.0]
  def change
    add_reference :payments, :person, null: false, foreign_key: true
  end
end
