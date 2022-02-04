class CreateUserFavs < ActiveRecord::Migration[6.1]
  def change
    create_table :user_favs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
