class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    drop_table :reservations
    create_table :reservations do |t|
      t.references :location
      t.references :user
      t.date :date_in
      t.date :date_out
      t.integer :nbPeople
      t.string :strip_reference

      t.timestamps
    end
  end
end
