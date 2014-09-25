class CreateBoatImages < ActiveRecord::Migration
  def change
    create_table :boat_images do |t|
      t.integer :boat_id
      t.string :filepicker_url

      t.timestamps
    end
    add_index :boat_images, :boat_id
  end
end
