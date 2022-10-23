# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_221_022_205_658) do
  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bosses", force: :cascade do |t|
    t.integer "boss_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "zone_id"
    t.index ["boss_id"], name: "index_bosses_on_boss_id", unique: true
    t.index ["zone_id"], name: "index_bosses_on_zone_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "item_id"
    t.string "name"
    t.integer "item_class"
    t.integer "item_subclass"
    t.string "item_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "boss_id"
    t.index ["boss_id"], name: "index_items_on_boss_id"
    t.index ["item_id"], name: "index_items_on_item_id", unique: true
  end

  create_table "stats", force: :cascade do |t|
    t.string "stat_type"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_id"
    t.index ["item_id"], name: "index_stats_on_item_id"
  end

  create_table "zones", force: :cascade do |t|
    t.integer "zone_id"
    t.string "name"
    t.string "zone_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["zone_id"], name: "index_zones_on_zone_id", unique: true
  end
end
