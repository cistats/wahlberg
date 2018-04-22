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

ActiveRecord::Schema.define(version: 20180422194557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "projects", force: :cascade do |t|
    t.text "org", null: false
    t.text "repo", null: false
    t.integer "github_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "team_id"
    t.index ["github_id"], name: "index_projects_on_github_id"
    t.index ["org", "repo"], name: "index_projects_on_org_and_repo"
    t.index ["team_id"], name: "index_projects_on_team_id"
  end

  create_table "team_members", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "team_id"
    t.index ["team_id"], name: "index_team_members_on_team_id"
    t.index ["user_id"], name: "index_team_members_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.text "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "projects", "teams"
  add_foreign_key "team_members", "teams"
  add_foreign_key "team_members", "users"
end
