class CreateEquipments < ActiveRecord::Migration[6.1]
  def change
    create_table :equipments do |t|
      t.string :value
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
