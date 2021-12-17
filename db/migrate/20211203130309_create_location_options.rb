class CreateLocationOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :location_options do |t|
      t.string :value

      t.timestamps
    end
  end
end
