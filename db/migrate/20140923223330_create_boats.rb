class CreateBoats < ActiveRecord::Migration
  def change
    create_table :boats do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.text :description
      t.string :style
      t.integer :price, null: false
      t.integer :size, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :boats, :price
    add_index :boats, :size
    add_index :boats, :style
    add_index :boats, :name
    add_index :boats, :user_id

  end
end
