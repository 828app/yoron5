class CreateIps < ActiveRecord::Migration[5.1]
  def change
    create_table :ips do |t|
      t.string :ip
      t.integer :topic_id
      t.timestamps null: false
    end
  end
end
