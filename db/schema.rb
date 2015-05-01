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

ActiveRecord::Schema.define(version: 20150501001551) do

  create_table "bids", force: true do |t|
    t.integer  "provider_id"
    t.integer  "post_id"
    t.integer  "amount"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bids", ["post_id"], name: "index_bids_on_post_id", using: :btree
  add_index "bids", ["provider_id"], name: "index_bids_on_provider_id", using: :btree

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consumers", force: true do |t|
    t.integer  "user_id"
    t.integer  "rating",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count",      default: 0
  end

  add_index "consumers", ["user_id"], name: "index_consumers_on_user_id", using: :btree

  create_table "line_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",   default: 1
    t.integer  "order_id"
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id", using: :btree
  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id", using: :btree
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree

  create_table "notifications", force: true do |t|
    t.integer  "post_id"
    t.integer  "bid_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["bid_id"], name: "index_notifications_on_bid_id", using: :btree
  add_index "notifications", ["post_id"], name: "index_notifications_on_post_id", using: :btree

  create_table "orders", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.string   "pay_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "picture"
    t.integer  "consumer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price"
    t.string   "categories"
    t.integer  "provider_id"
  end

  add_index "posts", ["consumer_id"], name: "index_posts_on_consumer_id", using: :btree
  add_index "posts", ["provider_id"], name: "index_posts_on_provider_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.decimal  "price",       precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "providers", force: true do |t|
    t.integer  "user_id"
    t.integer  "rating",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count",      default: 0
  end

  add_index "providers", ["user_id"], name: "index_providers_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "age"
    t.string   "phone"
    t.text     "address"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
