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

ActiveRecord::Schema[8.0].define(version: 2025_02_03_194752) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "needles", force: :cascade do |t|
    t.string "metric"
    t.string "us_size"
    t.string "uk_size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "needles_patterns", id: false, force: :cascade do |t|
    t.bigint "pattern_id", null: false
    t.bigint "needle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pattern_id", "needle_id"], name: "index_needles_patterns_on_pattern_id_and_needle_id"
  end

  create_table "patterns", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.string "craft_type", null: false
    t.float "price"
    t.string "currency"
    t.string "overall_yarn_weight"
    t.integer "nbr_stitches"
    t.integer "nbr_rows"
    t.integer "swatch_size"
    t.integer "repeats"
    t.string "gauge_pattern"
    t.integer "total_yardage"
    t.string "languages", default: ["en"], array: true
    t.string "sizes", default: [], array: true
    t.string "notes"
    t.string "pictures_path"
    t.string "pdf_path"
    t.integer "view_count"
    t.integer "likes"
    t.integer "difficulty_rating"
    t.integer "overall_rating"
    t.date "first_published_date"
    t.date "release_date"
    t.index ["user_id"], name: "index_patterns_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jti", null: false
    t.string "username", null: false
    t.string "refresh_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "patterns", "users"
end
