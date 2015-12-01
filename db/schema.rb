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

ActiveRecord::Schema.define(version: 20151129211617) do

  create_table "check_ins", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "venue_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "active",     default: true
    t.integer  "rating"
    t.string   "review"
  end

  add_index "check_ins", ["user_id"], name: "index_check_ins_on_user_id"
  add_index "check_ins", ["venue_id"], name: "index_check_ins_on_venue_id"

  create_table "downvotes", force: :cascade do |t|
    t.integer  "check_in_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "downvotes", ["check_in_id"], name: "index_downvotes_on_check_in_id"

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "upvotes", force: :cascade do |t|
    t.integer  "check_in_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "upvotes", ["check_in_id"], name: "index_upvotes_on_check_in_id"
  add_index "upvotes", ["user_id"], name: "index_upvotes_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "provider"
    t.string   "uid"
  end

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.float    "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "lat"
    t.float    "lng"
    t.boolean  "open_now"
    t.integer  "price"
  end

end
