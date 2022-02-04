class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :content
      t.references :user
      t.references :conversation

      t.timestamps
    end
  end
end
