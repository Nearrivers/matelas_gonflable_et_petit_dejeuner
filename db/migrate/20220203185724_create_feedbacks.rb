class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    drop_table :feedbacks
    create_table :feedbacks do |t|
      t.references :user, null: false, foreign_key: true
      t.float :score
      t.string :comment
      t.references :reservation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
