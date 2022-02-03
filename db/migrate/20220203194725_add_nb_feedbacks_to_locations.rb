class AddNbFeedbacksToLocations < ActiveRecord::Migration[6.1]
  def self.up
    add_column :locations, :nb_feedbacks, :integer, default: 0
  end
end
