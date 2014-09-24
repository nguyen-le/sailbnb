class CreateBoats < ActiveRecord::Migration
  def change
    create_table :boats do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.string :type
      t.text :description
      t.integer :price, null: false
      t.integer :size, null: false
      t.integer :owner_id, null: false

      t.timestamps
    end

    add_index :boats, :price
    add_index :boats, :size
    add_index :boats, :type
    add_index :boats, :name
    add_index :boats, :owner_id

  end
end