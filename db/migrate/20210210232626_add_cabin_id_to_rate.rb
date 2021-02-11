class AddCabinIdToRate < ActiveRecord::Migration[6.0]
  def change
    add_reference :rates, :cabin, null: false, foreign_key: true
  end
end
