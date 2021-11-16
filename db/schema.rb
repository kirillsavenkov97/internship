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

ActiveRecord::Schema.define(version: 2021_10_06_070926) do

  create_table "activities", force: :cascade do |t|
    t.integer "city_id"
    t.string "title"
    t.string "description"
    t.string "photo"
    t.integer "price"
    t.float "customers_review_rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "currency"
    t.float "weight"
    t.index ["city_id"], name: "index_activities_on_city_id"
    t.index ["id"], name: "index_activities_on_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.integer "weight"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "weight"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["id"], name: "index_tags_on_id"
  end

  create_table "tags_activities", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "activity_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_tags_activities_on_activity_id"
    t.index ["tag_id"], name: "index_tags_activities_on_tag_id"
  end

  add_foreign_key "activities", "cities"
  add_foreign_key "tags_activities", "activities"
  add_foreign_key "tags_activities", "tags"
end
