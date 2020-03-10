class AddPollToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :poll, :string
  end
end
