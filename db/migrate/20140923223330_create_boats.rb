class CreateBoats < ActiveRecord::Migration
  def change
    create_table :boats do |t|
      t.string  :name, null: false
      t.float   :lat, null: false
      t.float   :long, null: false
      t.text    :description
      t.string  :tagline, null: false
      t.string  :style, null: false
      t.integer  :size, null: false
      t.integer :price, null: false
      t.integer :user_id, null: false
      t.boolean :featured

      t.timestamps
    end

    add_index :boats, :price
    add_index :boats, :user_id

  end
end
