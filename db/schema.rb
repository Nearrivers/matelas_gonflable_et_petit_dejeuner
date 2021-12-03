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

ActiveRecord::Schema.define(version: 2021_12_03_131743) do

  create_table "categories", force: :cascade do |t|
    t.string "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "user1_id"
    t.integer "user2_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user1_id"], name: "index_conversations_on_user1_id"
    t.index ["user2_id"], name: "index_conversations_on_user2_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.string "value"
    t.integer "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_equipment_on_category_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "location_id"
    t.float "score"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_feedbacks_on_location_id"
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "l_options", force: :cascade do |t|
    t.string "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.integer "nbRoom"
    t.integer "nbBed"
    t.integer "type"
    t.string "description"
    t.string "city"
    t.string "street"
    t.string "zipcode"
    t.float "lat"
    t.float "long"
    t.float "price"
    t.float "avgScore"
    t.integer "equipments_id", null: false
    t.integer "locationOptions_id", null: false
    t.integer "reservation_id", null: false
    t.integer "feedbacks_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["equipments_id"], name: "index_locations_on_equipments_id"
    t.index ["feedbacks_id"], name: "index_locations_on_feedbacks_id"
    t.index ["locationOptions_id"], name: "index_locations_on_locationOptions_id"
    t.index ["reservation_id"], name: "index_locations_on_reservation_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.integer "user_id"
    t.integer "conversation_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "location_id"
    t.integer "user_id"
    t.date "date_in"
    t.date "date_out"
    t.integer "nbPeople"
    t.string "strip_reference"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_reservations_on_location_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "stripe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "equipment", "categories"
  add_foreign_key "locations", "equipments", column: "equipments_id"
  add_foreign_key "locations", "feedbacks", column: "feedbacks_id"
  add_foreign_key "locations", "locationOptions", column: "locationOptions_id"
  add_foreign_key "locations", "reservations"
end
