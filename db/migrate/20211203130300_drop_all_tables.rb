class DropAllTables < ActiveRecord::Migration[6.1]
  def change
    drop_table :locations
    drop_table :user_favs
    drop_table :reservations
  end
end