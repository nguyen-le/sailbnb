class CreateRentalRequests < ActiveRecord::Migration
  def change
    create_table :rental_requests do |t|
      t.date :start, null: false
      t.date :leave, null: false
      t.integer :guests, null: false
      t.string :status, null: false
      t.integer :boat_id, null: false
      t.integer :renter_id, null: false

      t.timestamps
    end
    add_index :rental_requests, :boat_id
    add_index :rental_requests, :renter_id
  end
end
