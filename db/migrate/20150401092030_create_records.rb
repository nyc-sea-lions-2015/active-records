class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :albumtitle, null: false
      t.string :artist, null: false
      t.string :genre, null: false
      t.text :owneropinion, null: false
      t.integer :releaseyear, null: false
      t.references :user

      t.timestamps null: false
    end
  end
end
