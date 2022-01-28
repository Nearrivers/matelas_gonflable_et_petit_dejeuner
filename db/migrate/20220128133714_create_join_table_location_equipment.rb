class CreateJoinTableLocationEquipment < ActiveRecord::Migration[6.1]
  def change
    create_join_table :locations, :equipments do |t|
      # t.index [:location_id, :equipment_id]
      # t.index [:equipment_id, :location_id]
    end
  end
end
