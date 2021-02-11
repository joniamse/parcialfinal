class CreateCabins < ActiveRecord::Migration[6.0]
  def change
    create_table :cabins do |t|
      t.integer :number

      t.timestamps
    end
  end
end
