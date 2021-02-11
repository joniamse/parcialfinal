class AddCarIdToRate < ActiveRecord::Migration[6.0]
  def change
    add_reference :rates, :car, null: false, foreign_key: true
  end
end
