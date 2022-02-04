class AddIsHostToUser < ActiveRecord::Migration[6.1]
  def self.up
    add_column :users, :is_host, :boolean, default: false
  end
end
