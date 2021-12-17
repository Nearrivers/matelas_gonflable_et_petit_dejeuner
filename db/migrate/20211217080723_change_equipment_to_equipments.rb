class ChangeEquipmentToEquipments < ActiveRecord::Migration[6.1]
  def change
    rename_table :equipment, :equipments
  end
end
