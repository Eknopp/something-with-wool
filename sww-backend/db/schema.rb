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

ActiveRecord::Schema[8.0].define(version: 2025_03_05_105811) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "type", null: false
    t.string "main_category", null: false
    t.string "sub_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["main_category"], name: "index_categories_on_main_category"
    t.index ["type"], name: "index_categories_on_type"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "favoritable_type", null: false
    t.bigint "favoritable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["favoritable_id"], name: "index_favorites_on_favoritable_id"
    t.index ["favoritable_type", "favoritable_id"], name: "index_favorites_on_favoritable"
    t.index ["favoritable_type"], name: "index_favorites_on_favoritable_type"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "followers", force: :cascade do |t|
    t.bigint "followee_id", null: false
    t.bigint "follower_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followee_id"], name: "index_followers_on_followee_id"
    t.index ["follower_id"], name: "index_followers_on_follower_id"
  end

  create_table "hooks", force: :cascade do |t|
    t.string "metric_mm", null: false
    t.string "us_size", null: false
    t.string "uk_size", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issues", force: :cascade do |t|
    t.bigint "magazine_id", null: false
    t.string "name", null: false
    t.string "pictures_path"
    t.date "release_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["magazine_id"], name: "index_issues_on_magazine_id"
    t.index ["name"], name: "index_issues_on_name"
    t.index ["release_date"], name: "index_issues_on_release_date"
  end

  create_table "magazines", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.string "website"
    t.string "cover_picture_path"
    t.text "biography"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_magazines_on_user_id"
  end

  create_table "needles", force: :cascade do |t|
    t.string "metric"
    t.string "us_size"
    t.string "uk_size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patterns", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.string "craft_type", null: false
    t.float "price"
    t.string "currency"
    t.string "overall_yarn_weight", null: false
    t.integer "nbr_stitches", null: false
    t.integer "nbr_rows", null: false
    t.integer "swatch_size", null: false
    t.integer "repeats"
    t.string "gauge_pattern"
    t.integer "total_yardage"
    t.string "languages", default: ["en"], array: true
    t.string "sizes", default: [], array: true
    t.string "notes"
    t.string "pictures_path", null: false
    t.string "pdf_path", null: false
    t.integer "likes"
    t.integer "difficulty_rating"
    t.integer "overall_rating"
    t.date "first_published_date", null: false
    t.date "release_date"
    t.index ["craft_type"], name: "index_patterns_on_craft_type"
    t.index ["name"], name: "index_patterns_on_name"
    t.index ["user_id"], name: "index_patterns_on_user_id"
  end

  create_table "patterns_categories", force: :cascade do |t|
    t.bigint "pattern_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_patterns_categories_on_category_id"
    t.index ["pattern_id"], name: "index_patterns_categories_on_pattern_id"
  end

  create_table "patterns_hooks", force: :cascade do |t|
    t.bigint "pattern_id", null: false
    t.bigint "hook_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hook_id"], name: "index_patterns_hooks_on_hook_id"
    t.index ["pattern_id"], name: "index_patterns_hooks_on_pattern_id"
  end

  create_table "patterns_magazines", force: :cascade do |t|
    t.bigint "pattern_id", null: false
    t.bigint "magazine_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["magazine_id"], name: "index_patterns_magazines_on_magazine_id"
    t.index ["pattern_id"], name: "index_patterns_magazines_on_pattern_id"
  end

  create_table "patterns_needles", force: :cascade do |t|
    t.bigint "pattern_id", null: false
    t.bigint "needle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["needle_id"], name: "index_patterns_needles_on_needle_id"
    t.index ["pattern_id"], name: "index_patterns_needles_on_pattern_id"
  end

  create_table "patterns_tags", force: :cascade do |t|
    t.bigint "pattern_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pattern_id"], name: "index_patterns_tags_on_pattern_id"
    t.index ["tag_id"], name: "index_patterns_tags_on_tag_id"
  end

  create_table "patterns_yarns", force: :cascade do |t|
    t.bigint "pattern_id", null: false
    t.bigint "yarn_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pattern_id"], name: "index_patterns_yarns_on_pattern_id"
    t.index ["yarn_id"], name: "index_patterns_yarns_on_yarn_id"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "pattern_id", null: false
    t.string "name"
    t.string "status"
    t.string "notes"
    t.string "size"
    t.decimal "stitches"
    t.decimal "rows"
    t.string "swatch_size"
    t.string "gauge_pattern"
    t.date "project_started"
    t.date "project_finished"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pattern_id"], name: "index_projects_on_pattern_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "projects_categories", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_projects_categories_on_category_id"
    t.index ["project_id"], name: "index_projects_categories_on_project_id"
  end

  create_table "projects_hooks", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "hook_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hook_id"], name: "index_projects_hooks_on_hook_id"
    t.index ["project_id"], name: "index_projects_hooks_on_project_id"
  end

  create_table "projects_needles", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "needle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["needle_id"], name: "index_projects_needles_on_needle_id"
    t.index ["project_id"], name: "index_projects_needles_on_project_id"
  end

  create_table "projects_tags", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_projects_tags_on_project_id"
    t.index ["tag_id"], name: "index_projects_tags_on_tag_id"
  end

  create_table "projects_yarns", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "yarn_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_projects_yarns_on_project_id"
    t.index ["yarn_id"], name: "index_projects_yarns_on_yarn_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "purchasable_type", null: false
    t.bigint "purchasable_id", null: false
    t.decimal "price", precision: 10, scale: 2, null: false
    t.string "currency", default: "EUR", null: false
    t.date "purchase_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purchasable_id"], name: "index_purchases_on_purchasable_id"
    t.index ["purchasable_type", "purchasable_id"], name: "index_purchases_on_purchasable"
    t.index ["purchasable_type"], name: "index_purchases_on_purchasable_type"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name"
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
    t.string "name", default: "Anonymous", null: false
    t.string "location"
    t.string "language", default: "en", null: false
    t.string "pronouns"
    t.text "biography"
    t.string "units", default: "metric", null: false
    t.string "role", default: "user", null: false
    t.string "website"
    t.string "preferred_currency", default: "EUR", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "users_yarns", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "yarn_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_users_yarns_on_user_id"
    t.index ["yarn_id"], name: "index_users_yarns_on_yarn_id"
  end

  create_table "yarns", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "weight", null: false
    t.decimal "meterage", null: false
    t.decimal "unit_weight", null: false
    t.string "gauge"
    t.string "fibers", null: false
    t.string "texture"
    t.boolean "machine_wash"
    t.string "pictures_path"
    t.string "dye"
    t.string "origin"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "colors", default: [], array: true
    t.index ["user_id"], name: "index_yarns_on_user_id"
  end

  create_table "yarns_hooks", force: :cascade do |t|
    t.bigint "yarn_id", null: false
    t.bigint "hook_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hook_id"], name: "index_yarns_hooks_on_hook_id"
    t.index ["yarn_id"], name: "index_yarns_hooks_on_yarn_id"
  end

  create_table "yarns_needles", force: :cascade do |t|
    t.bigint "yarn_id", null: false
    t.bigint "needle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["needle_id"], name: "index_yarns_needles_on_needle_id"
    t.index ["yarn_id"], name: "index_yarns_needles_on_yarn_id"
  end

  add_foreign_key "favorites", "users"
  add_foreign_key "followers", "users", column: "followee_id"
  add_foreign_key "followers", "users", column: "follower_id"
  add_foreign_key "issues", "magazines"
  add_foreign_key "magazines", "users"
  add_foreign_key "patterns", "users"
  add_foreign_key "patterns_categories", "categories"
  add_foreign_key "patterns_categories", "patterns"
  add_foreign_key "patterns_hooks", "hooks"
  add_foreign_key "patterns_hooks", "patterns"
  add_foreign_key "patterns_magazines", "magazines"
  add_foreign_key "patterns_magazines", "patterns"
  add_foreign_key "patterns_needles", "patterns"
  add_foreign_key "patterns_tags", "patterns"
  add_foreign_key "patterns_tags", "tags"
  add_foreign_key "patterns_yarns", "patterns"
  add_foreign_key "patterns_yarns", "yarns"
  add_foreign_key "projects", "patterns"
  add_foreign_key "projects", "users"
  add_foreign_key "projects_categories", "categories"
  add_foreign_key "projects_categories", "projects"
  add_foreign_key "projects_hooks", "hooks"
  add_foreign_key "projects_hooks", "projects"
  add_foreign_key "projects_needles", "needles"
  add_foreign_key "projects_needles", "projects"
  add_foreign_key "projects_tags", "projects"
  add_foreign_key "projects_tags", "tags"
  add_foreign_key "projects_yarns", "projects"
  add_foreign_key "projects_yarns", "yarns"
  add_foreign_key "purchases", "users"
  add_foreign_key "users_yarns", "users"
  add_foreign_key "users_yarns", "yarns"
  add_foreign_key "yarns", "users"
  add_foreign_key "yarns_hooks", "hooks"
  add_foreign_key "yarns_hooks", "yarns"
  add_foreign_key "yarns_needles", "needles"
  add_foreign_key "yarns_needles", "yarns"
end
