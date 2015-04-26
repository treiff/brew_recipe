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

ActiveRecord::Schema.define(version: 20150426005202) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beers", force: true do |t|
    t.string   "name"
    t.string   "style"
    t.text     "description"
    t.decimal  "og",                    precision: 4, scale: 3
    t.decimal  "fg",                    precision: 4, scale: 3
    t.decimal  "abv",                   precision: 2, scale: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "beer_xml_file_name"
    t.string   "beer_xml_content_type"
    t.integer  "beer_xml_file_size"
    t.datetime "beer_xml_updated_at"
  end

  add_index "beers", ["user_id"], name: "index_beers_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "avatar_url"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
