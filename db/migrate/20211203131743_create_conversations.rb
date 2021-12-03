class CreateConversations < ActiveRecord::Migration[6.1]
  def change
    create_table :conversations do |t|
      t.references :user1
      t.references :user2

      t.timestamps
    end
  end
end
