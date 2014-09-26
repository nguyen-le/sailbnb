class CreateBoatImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :boat_id
      t.string :filepicker_url

      t.timestamps
    end
    add_index :images, :boat_id
  end
end
