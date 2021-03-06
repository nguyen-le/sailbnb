# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140930053458) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boats", force: true do |t|
    t.string   "name",        null: false
    t.float    "lat",         null: false
    t.float    "long",        null: false
    t.text     "description"
    t.string   "tagline",     null: false
    t.string   "style",       null: false
    t.string   "size",        null: false
    t.integer  "price",       null: false
    t.integer  "user_id",     null: false
    t.boolean  "featured"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boats", ["price"], name: "index_boats_on_price", using: :btree
  add_index "boats", ["user_id"], name: "index_boats_on_user_id", using: :btree

  create_table "images", force: true do |t|
    t.integer  "boat_id"
    t.string   "filepicker_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["boat_id"], name: "index_images_on_boat_id", using: :btree

  create_table "rental_requests", force: true do |t|
    t.date     "start",      null: false
    t.date     "leave",      null: false
    t.integer  "guests",     null: false
    t.string   "status",     null: false
    t.integer  "boat_id",    null: false
    t.integer  "renter_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rental_requests", ["boat_id"], name: "index_rental_requests_on_boat_id", using: :btree
  add_index "rental_requests", ["renter_id"], name: "index_rental_requests_on_renter_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "f_name",          null: false
    t.string   "l_name",          null: false
    t.string   "nickname"
    t.string   "email",           null: false
    t.string   "location"
    t.string   "slogan"
    t.text     "intro"
    t.string   "work"
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", using: :btree

end
