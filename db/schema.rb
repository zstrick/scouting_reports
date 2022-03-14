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

ActiveRecord::Schema[7.0].define(version: 2022_03_14_024545) do
  create_table "pitcher_reports", force: :cascade do |t|
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pitches", force: :cascade do |t|
    t.string "pitch_type"
    t.integer "velocity_high"
    t.integer "velocity_low"
    t.integer "pitcher_report_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pitcher_report_id"], name: "index_pitches_on_pitcher_report_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "position_reports", force: :cascade do |t|
    t.string "position"
    t.integer "batting_grade"
    t.decimal "running_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "scout_id", null: false
    t.text "summary"
    t.string "reportable_type"
    t.bigint "reportable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_reports_on_player_id"
    t.index ["scout_id"], name: "index_reports_on_scout_id"
  end

  create_table "scouts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "pitches", "pitcher_reports"
  add_foreign_key "reports", "players"
  add_foreign_key "reports", "scouts"
end
