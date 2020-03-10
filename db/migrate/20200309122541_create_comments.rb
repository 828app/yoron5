class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :name
      t.text :text
      t.integer :topic_id
      t.string :ip
      t.integer :num
      t.timestamps null: false
      t.timestamps
    end
  end
end
