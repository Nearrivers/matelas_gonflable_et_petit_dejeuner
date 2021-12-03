class AddAttributeToMessage < ActiveRecord::Migration[6.1]
  def change
    add_reference :messages, :conversation, null: true, foreign_key: true
  end
end
