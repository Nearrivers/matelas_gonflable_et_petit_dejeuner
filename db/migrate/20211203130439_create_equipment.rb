class CreateEquipment < ActiveRecord::Migration[6.1]
  def change
    create_table :equipment do |t|
      t.string :value
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
