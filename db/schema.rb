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

ActiveRecord::Schema[7.0].define(version: 2023_01_10_120730) do
  create_table "image_sets", force: :cascade do |t|
    t.string "title"
    t.string "typ"
    t.string "color"
    t.integer "map_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["map_id"], name: "index_image_sets_on_map_id"
  end

  create_table "maps", force: :cascade do |t|
    t.string "title"
    t.decimal "lat"
    t.decimal "lng"
    t.decimal "zoom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "image_sets", "maps"
end
