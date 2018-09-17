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

ActiveRecord::Schema.define(version: 2018_09_16_024605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comment_projects", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "project_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_comment_projects_on_project_id"
    t.index ["user_id"], name: "index_comment_projects_on_user_id"
  end

  create_table "comment_publications", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "publication_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publication_id"], name: "index_comment_publications_on_publication_id"
    t.index ["user_id"], name: "index_comment_publications_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.text "description"
    t.integer "state"
    t.bigint "user_id"
    t.bigint "publication_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publication_id"], name: "index_notifications_on_publication_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "information"
    t.string "name"
    t.text "description"
    t.string "photo"
    t.integer "visits_count"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cover_file_name"
    t.string "cover_content_type"
    t.bigint "cover_file_size"
    t.datetime "cover_updated_at"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "publications", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.text "information"
    t.string "photo"
    t.integer "visits_count"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cover_file_name"
    t.string "cover_content_type"
    t.bigint "cover_file_size"
    t.datetime "cover_updated_at"
    t.index ["user_id"], name: "index_publications_on_user_id"
  end

  create_table "state_projects", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "project_id"
    t.integer "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_state_projects_on_project_id"
    t.index ["user_id"], name: "index_state_projects_on_user_id"
  end

  create_table "state_publications", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "publication_id"
    t.integer "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publication_id"], name: "index_state_publications_on_publication_id"
    t.index ["user_id"], name: "index_state_publications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.integer "cc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "permission_level", default: 1
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comment_projects", "projects"
  add_foreign_key "comment_projects", "users"
  add_foreign_key "comment_publications", "publications"
  add_foreign_key "comment_publications", "users"
  add_foreign_key "notifications", "publications"
  add_foreign_key "notifications", "users"
  add_foreign_key "projects", "users"
  add_foreign_key "publications", "users"
  add_foreign_key "state_projects", "projects"
  add_foreign_key "state_projects", "users"
  add_foreign_key "state_publications", "publications"
  add_foreign_key "state_publications", "users"
end
