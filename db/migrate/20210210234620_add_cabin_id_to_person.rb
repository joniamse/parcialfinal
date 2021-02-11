class AddCabinIdToPerson < ActiveRecord::Migration[6.0]
  def change
    add_reference :people, :cabin, null: false, foreign_key: true
  end
end
