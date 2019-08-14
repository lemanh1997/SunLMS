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

ActiveRecord::Schema.define(version: 2019_08_13_030440) do

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.string "nickname"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.string "content"
    t.integer "pages", default: 0
    t.integer "number_of", default: 0
    t.integer "author_id"
    t.integer "category_id"
    t.integer "publisher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_books_on_author_id"
    t.index ["category_id"], name: "index_books_on_category_id"
    t.index ["publisher_id"], name: "index_books_on_publisher_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "user_id"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture"
    t.index ["book_id"], name: "index_comments_on_book_id"
    t.index ["user_id", "book_id", "created_at"], name: "index_comments_on_user_id_and_book_id_and_created_at"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationship_authors", force: :cascade do |t|
    t.integer "author_f_id"
    t.integer "user_f_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_f_id", "user_f_id"], name: "index_relationship_authors_on_author_f_id_and_user_f_id", unique: true
    t.index ["author_f_id"], name: "index_relationship_authors_on_author_f_id"
    t.index ["user_f_id"], name: "index_relationship_authors_on_user_f_id"
  end

  create_table "relationship_users", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationship_users_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationship_users_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationship_users_on_follower_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "content"
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "level", default: 0
  end

end
