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

ActiveRecord::Schema.define(version: 20150512215541) do

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

  create_table "conreviews", force: true do |t|
    t.integer  "rating"
    t.text     "description"
    t.integer  "provider_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conreviews", ["post_id"], name: "index_conreviews_on_post_id", using: :btree
  add_index "conreviews", ["provider_id"], name: "index_conreviews_on_provider_id", using: :btree

  create_table "consumers", force: true do |t|
    t.integer  "user_id"
    t.decimal  "rating",     precision: 3, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count",                              default: 0
  end

  add_index "consumers", ["user_id"], name: "index_consumers_on_user_id", using: :btree

  create_table "conversations", force: true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conversations", ["recipient_id"], name: "index_conversations_on_recipient_id", using: :btree
  add_index "conversations", ["sender_id"], name: "index_conversations_on_sender_id", using: :btree

  create_table "messages", force: true do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "notifications", force: true do |t|
    t.integer  "post_id"
    t.integer  "bid_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["bid_id"], name: "index_notifications_on_bid_id", using: :btree
  add_index "notifications", ["post_id"], name: "index_notifications_on_post_id", using: :btree

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

  create_table "proreviews", force: true do |t|
    t.integer  "rating"
    t.text     "description"
    t.integer  "consumer_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "proreviews", ["consumer_id"], name: "index_proreviews_on_consumer_id", using: :btree
  add_index "proreviews", ["post_id"], name: "index_proreviews_on_post_id", using: :btree

  create_table "providers", force: true do |t|
    t.integer  "user_id"
    t.decimal  "rating",     precision: 3, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count",                              default: 0
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
    t.integer  "age"
    t.string   "phone"
    t.text     "address"
    t.string   "first"
    t.string   "last"
    t.string   "picture"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
