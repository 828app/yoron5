class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.string :title
      t.string :name
      t.text :text
      t.string :yoron1
      t.string :yoron2
      t.string :yoron3
      t.string :yoron4
      t.string :yoron5
      t.string :yoron6
      t.string :yoron7
      t.integer :poll1
      t.integer :poll2
      t.integer :poll3
      t.integer :poll4
      t.integer :poll5
      t.integer :poll6
      t.integer :poll7
      t.integer :coms
      t.integer :pollnum
      t.integer :comments
      t.string :ip
      t.integer :recent
      t.timestamps null: false
    end
  end
end
