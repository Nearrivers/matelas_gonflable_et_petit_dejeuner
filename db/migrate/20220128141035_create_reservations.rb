class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    drop_table :reservations
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.float :price
      t.datetime :date_in
      t.datetime :date_out
      t.integer :nb_people
      t.string :stripe_reference
      t.boolean :status

      t.timestamps
    end
  end
end
