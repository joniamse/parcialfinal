class RemoveCabinIdFromRate < ActiveRecord::Migration[6.0]
  def change
    remove_reference :rates, :cabin, null: false, foreign_key: true
  end
end
