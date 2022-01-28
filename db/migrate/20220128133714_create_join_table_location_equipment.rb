class CreateJoinTableLocationEquipment < ActiveRecord::Migration[6.1]
  def change
    create_join_table :locations, :appliances do |t|
      # t.index [:location_id, :appliance_id]
      # t.index [:appliance_id, :location_id]
    end
  end
end
