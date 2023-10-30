# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_10_30_034617) do
  create_table "competitions", force: :cascade do |t|
    t.string "name"
    t.integer "win"
    t.integer "draw"
    t.integer "loss"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_competitions_on_user_id"
  end

  create_table "competitors", force: :cascade do |t|
    t.integer "competition_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competition_id"], name: "index_competitors_on_competition_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "competition_id", null: false
    t.integer "competitor1_id"
    t.integer "competitor2_id"
    t.integer "competitor1_score"
    t.integer "competitor2_score"
    t.datetime "datetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "round"
    t.index ["competition_id"], name: "index_matches_on_competition_id"
    t.index ["competitor1_id"], name: "index_matches_on_competitor1_id"
    t.index ["competitor2_id"], name: "index_matches_on_competitor2_id"
  end

  create_table "standings", force: :cascade do |t|
    t.integer "competition_id", null: false
    t.integer "competitor_id"
    t.integer "points", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "wins", default: 0
    t.integer "losses", default: 0
    t.integer "draws", default: 0
    t.index ["competition_id"], name: "index_standings_on_competition_id"
    t.index ["competitor_id"], name: "index_standings_on_competitor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "auth0_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "competitions", "users"
  add_foreign_key "competitors", "competitions", on_delete: :cascade
  add_foreign_key "matches", "competitions", on_delete: :cascade
  add_foreign_key "matches", "competitors", column: "competitor1_id"
  add_foreign_key "matches", "competitors", column: "competitor2_id"
  add_foreign_key "standings", "competitions", on_delete: :cascade
  add_foreign_key "standings", "competitors"
end
