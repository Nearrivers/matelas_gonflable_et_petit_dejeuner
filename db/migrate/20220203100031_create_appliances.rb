class CreateAppliances < ActiveRecord::Migration[6.1]
  def change
    drop_table :appliances
    create_table :appliances do |t|
      t.string :value
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
