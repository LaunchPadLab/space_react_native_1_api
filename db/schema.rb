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

ActiveRecord::Schema[7.1].define(version: 2025_04_10_174650) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"

  create_table "attendees", force: :cascade do |t|
    t.bigint "room_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_attendees_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "invite_code"
    t.integer "host_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms_venues", force: :cascade do |t|
    t.bigint "room_id"
    t.bigint "venue_id"
    t.index ["room_id"], name: "index_rooms_venues_on_room_id"
    t.index ["venue_id"], name: "index_rooms_venues_on_venue_id"
  end

  create_table "venues", force: :cascade do |t|
    t.integer "cost"
    t.string "menu_link"
    t.integer "rating"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "versions", force: :cascade do |t|
    t.string "whodunnit"
    t.datetime "created_at"
    t.bigint "item_id", null: false
    t.string "item_type", null: false
    t.string "event", null: false
    t.text "object"
    t.text "object_changes"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "rooms_venues_id", null: false
    t.bigint "attendee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attendee_id"], name: "index_votes_on_attendee_id"
    t.index ["rooms_venues_id"], name: "index_votes_on_rooms_venues_id"
  end

  add_foreign_key "votes", "attendees"
  add_foreign_key "votes", "rooms_venues", column: "rooms_venues_id"
end
