class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.string :description
      t.integer :value
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
