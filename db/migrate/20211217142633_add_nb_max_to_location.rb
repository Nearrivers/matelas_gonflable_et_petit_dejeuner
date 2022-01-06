class AddNbMaxToLocation < ActiveRecord::Migration[6.1]
  def change
    add_column :locations, :nb_people_max, :integer
  end
end
