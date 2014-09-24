class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :f_name, null: false
      t.string :l_name, null: false
      t.string :nickname
      t.string :email, null: false
      t.string :location
      t.string :slogan
      t.text   :intro
      t.string :work
      t.string :password_digest, null: false
      t.string :session_token, null: false

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :session_token
  end
end
