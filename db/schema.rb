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

ActiveRecord::Schema.define(version: 20170820184105) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_picks", force: :cascade do |t|
    t.integer "picked_by"
    t.integer "card_id"
    t.integer "poule_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "card_name"
    t.string "rarity"
    t.string "image_url"
  end

  create_table "dice_roll_rounds", force: :cascade do |t|
    t.integer "poule_id"
    t.json    "state"
    t.boolean "round_finished"
  end

  create_table "players", force: :cascade do |t|
    t.integer "user_id"
    t.integer "poule_id"
    t.integer "position"
  end

  create_table "poules", force: :cascade do |t|
    t.string  "name"
    t.integer "state"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "single_access_token"
    t.string   "perishable_token"
    t.integer  "login_count",         default: 0,     null: false
    t.integer  "failed_login_count",  default: 0,     null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.boolean  "active",              default: false
    t.boolean  "approved",            default: false
    t.boolean  "confirmed",           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["perishable_token"], name: "index_users_on_perishable_token", unique: true, using: :btree
  add_index "users", ["persistence_token"], name: "index_users_on_persistence_token", unique: true, using: :btree
  add_index "users", ["single_access_token"], name: "index_users_on_single_access_token", unique: true, using: :btree

end
