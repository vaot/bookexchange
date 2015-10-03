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

ActiveRecord::Schema.define(version: 20151003182609) do

  create_table "auth_keys", force: true do |t|
    t.integer  "owner_id"
    t.datetime "expires_at"
    t.string   "owner_type"
    t.string   "auth_key",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bids", force: true do |t|
    t.float    "price"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "bids", ["owner_id"], name: "index_bids_on_owner_id"
  add_index "bids", ["user_id"], name: "index_bids_on_user_id"

  create_table "books", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "isbn"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "accept_offers", default: true
    t.boolean  "show_offers",   default: true
    t.integer  "user_id"
    t.string   "visibility",    default: "public", null: false
    t.text     "tags"
  end

  add_index "books", ["user_id"], name: "index_books_on_user_id"
  add_index "books", ["visibility"], name: "index_books_on_visibility"

  create_table "media", force: true do |t|
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.integer  "owner_id"
    t.string   "owner_type"
  end

  add_index "media", ["owner_id"], name: "index_media_on_owner_id"
  add_index "media", ["owner_type"], name: "index_media_on_owner_type"

  create_table "notifications", force: true do |t|
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "message"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["owner_id"], name: "index_notifications_on_owner_id"

  create_table "users", force: true do |t|
    t.string   "email",      default: "", null: false
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "gender"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
