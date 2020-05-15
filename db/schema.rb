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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2020_05_06_223025) do
=======
ActiveRecord::Schema.define(version: 2020_05_06_160120) do
>>>>>>> 2e48a251abd03b2f95cecba81ac4814999e76049

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

<<<<<<< HEAD
  create_table "apis", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

=======
>>>>>>> 2e48a251abd03b2f95cecba81ac4814999e76049
  create_table "likes", force: :cascade do |t|
    t.bigint "tweet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["tweet_id"], name: "index_likes_on_tweet_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags_tweets", id: false, force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "tweet_id", null: false
    t.index ["tag_id", "tweet_id"], name: "index_tags_tweets_on_tag_id_and_tweet_id", unique: true
    t.index ["tag_id"], name: "index_tags_tweets_on_tag_id"
    t.index ["tweet_id"], name: "index_tags_tweets_on_tweet_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.text "content"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "tweet_id"
    t.index ["tweet_id"], name: "index_tweets_on_tweet_id"
    t.index ["user_id"], name: "index_tweets_on_user_id"
  end

  create_table "tweets_tags", id: false, force: :cascade do |t|
    t.bigint "tweet_id"
    t.bigint "tag_id"
    t.index ["tag_id"], name: "index_tweets_tags_on_tag_id"
    t.index ["tweet_id"], name: "index_tweets_tags_on_tweet_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "profile_photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "status"
    t.boolean "active", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "likes", "tweets"
  add_foreign_key "likes", "users"
  add_foreign_key "tweets", "tweets"
  add_foreign_key "tweets", "users"
  add_foreign_key "tweets_tags", "tags"
  add_foreign_key "tweets_tags", "tweets"
end
