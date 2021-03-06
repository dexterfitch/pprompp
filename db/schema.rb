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

ActiveRecord::Schema.define(version: 2020_11_10_223115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "species"
    t.string "race"
    t.integer "age"
    t.integer "average_lifespan"
    t.string "physical_description"
    t.string "notes"
    t.boolean "shared"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goals", force: :cascade do |t|
    t.integer "user_id"
    t.string "description"
    t.string "notes"
    t.boolean "shared"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "motivations", force: :cascade do |t|
    t.integer "user_id"
    t.string "description"
    t.string "notes"
    t.boolean "shared"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prompts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "character_id"
    t.bigint "goal_id"
    t.bigint "motivation_id"
    t.bigint "tactic_id"
    t.string "notes"
    t.string "url"
    t.boolean "shared"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_prompts_on_character_id"
    t.index ["goal_id"], name: "index_prompts_on_goal_id"
    t.index ["motivation_id"], name: "index_prompts_on_motivation_id"
    t.index ["tactic_id"], name: "index_prompts_on_tactic_id"
    t.index ["user_id"], name: "index_prompts_on_user_id"
  end

  create_table "tactics", force: :cascade do |t|
    t.integer "user_id"
    t.string "description"
    t.string "notes"
    t.boolean "shared"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "full_name"
    t.string "uid"
    t.string "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "prompts", "characters"
  add_foreign_key "prompts", "goals"
  add_foreign_key "prompts", "motivations"
  add_foreign_key "prompts", "tactics"
  add_foreign_key "prompts", "users"
end
