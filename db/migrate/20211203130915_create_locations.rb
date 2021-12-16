class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :nbRoom
      t.integer :nbBed
      t.integer :type
      t.string :description
      t.string :city
      t.string :street
      t.string :zipcode
      t.float :lat
      t.float :long
      t.float :price
      t.float :avgScore
      t.references :equipments, null: false, foreign_key: true
      t.references :locationOptions, null: false, foreign_key: true
      t.references :reservation, null: false, foreign_key: true
      t.references :feedbacks, null: false, foreign_key: true

      t.timestamps
    end
  end
end
