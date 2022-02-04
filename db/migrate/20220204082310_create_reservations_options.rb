class CreateReservationsOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations_options do |t|
      t.references :reservation, null: false, foreign_key: true
      t.references :option, null: false, foreign_key: true

      t.timestamps
    end
  end
end
