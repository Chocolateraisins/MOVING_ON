class CreateServiceItems < ActiveRecord::Migration[5.2]
  def change
    create_table :service_items do |t|
      t.string :content
      t.references :service, foreign_key: true
      t.integer :unit_price
      t.boolean :quantifiable
      t.string :type

      t.timestamps
    end
  end
end
