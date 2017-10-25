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

ActiveRecord::Schema.define(version: 20171025023603) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "project_users", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id", "user_id"], name: "index_project_users_on_project_id_and_user_id", unique: true
    t.index ["project_id"], name: "index_project_users_on_project_id"
    t.index ["user_id"], name: "index_project_users_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.text "org", null: false
    t.text "repo", null: false
    t.integer "github_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["github_id"], name: "index_projects_on_github_id"
    t.index ["org", "repo"], name: "index_projects_on_org_and_repo"
  end

  create_table "users", force: :cascade do |t|
    t.text "name", null: false
    t.text "email", null: false
    t.text "image"
    t.datetime "remember_created_at"
    t.text "remember_token"
    t.text "github_uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "username", null: false
    t.text "github_token"
    t.datetime "github_synced_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "project_users", "projects"
  add_foreign_key "project_users", "users"
end
