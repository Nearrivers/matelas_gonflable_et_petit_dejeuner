class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :nb_room
      t.integer :nb_bed
      t.integer :type_location
      t.text :description
      t.string :city
      t.string :street
      t.string :zip_code
      t.float :lat
      t.float :long
      t.float :price
      t.float :avg_score

      t.timestamps
    end

    def self.up
      rename_column :locations, :locationOptions, :location_options
    end
  end
end
