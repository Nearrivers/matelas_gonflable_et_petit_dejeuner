class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.references :user
      t.references :location
      t.float :score
      t.text :comment

      t.timestamps
    end
  end
end
