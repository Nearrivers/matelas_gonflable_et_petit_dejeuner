class UpdateTypeFromLocations < ActiveRecord::Migration[6.1]
  def self.up
    rename_column :locations, :type, :type_location
  end
end
