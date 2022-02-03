class CreateLocationAppliances < ActiveRecord::Migration[6.1]
  def change
    drop_table :location_appliances
    create_table :location_appliances do |t|
      t.references :location, null: false, foreign_key: true
      t.references :appliance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
