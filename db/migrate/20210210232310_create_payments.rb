class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.integer :import
      t.integer :return
      t.date :bill_date

      t.timestamps
    end
  end
end
