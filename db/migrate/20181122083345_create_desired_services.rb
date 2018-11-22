class CreateDesiredServices < ActiveRecord::Migration[5.2]
  def change
    create_table :desired_services do |t|
      t.integer :amount
      t.references :service, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
