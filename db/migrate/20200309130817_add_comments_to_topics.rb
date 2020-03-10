class AddCommentsToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :comments, :integer
  end
end
