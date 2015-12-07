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

ActiveRecord::Schema.define(version: 20151207035033) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bids", force: :cascade do |t|
    t.decimal  "amount",     precision: 15, scale: 2, null: false
    t.integer  "bidder_id",                           null: false
    t.integer  "item_id",                             null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "title",                                 null: false
    t.text     "description"
    t.decimal  "starting_bid", precision: 15, scale: 2
    t.datetime "start",                                 null: false
    t.datetime "end",                                   null: false
    t.integer  "seller_id",                             null: false
    t.integer  "buyer_id"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username",        null: false
    t.string "email",           null: false
    t.string "password_digest"
  end

end
