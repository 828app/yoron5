class AddRecentToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :recent, :integer
  end
end
