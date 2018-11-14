class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :status
      t.integer :invoice_amount
      t.string :deceased_first_name
      t.string :deceased_last_name
      t.string :deceased_address
      t.date :date_of_death
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
