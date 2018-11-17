class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.references :service_item, foreign_key: true
      t.string :content
      t.boolean :completed

      t.timestamps
    end
  end
end