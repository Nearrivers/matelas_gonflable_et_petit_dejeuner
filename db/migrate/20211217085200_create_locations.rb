class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :nb_people_max, default: 0
      t.integer :nb_room, default: 0
      t.integer :nb_bed, default: 0
      t.string :type_location
      t.text :description
      t.string :city
      t.string :street
      t.string :zip_code
      t.float :lat
      t.float :long
      t.float :price
      t.float :avg_score, default: 0

      t.timestamps
    end
  end
end
