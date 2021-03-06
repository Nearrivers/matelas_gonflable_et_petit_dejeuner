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

ActiveRecord::Schema.define(version: 2022_02_04_082310) do

  create_table "appliances", force: :cascade do |t|
    t.string "value"
    t.integer "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_appliances_on_category_id"
  end

  create_table "appliances_locations", id: false, force: :cascade do |t|
    t.integer "location_id", null: false
    t.integer "appliance_id", null: false
  end

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
    t.integer "user_id", null: false
    t.float "score"
    t.string "comment"
    t.integer "reservation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reservation_id"], name: "index_feedbacks_on_reservation_id"
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "l_options", force: :cascade do |t|
    t.string "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "location_appliances", force: :cascade do |t|
    t.integer "location_id", null: false
    t.integer "appliance_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["appliance_id"], name: "index_location_appliances_on_appliance_id"
    t.index ["location_id"], name: "index_location_appliances_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.integer "nb_people_max"
    t.integer "nb_room"
    t.integer "nb_bed"
    t.string "type_location"
    t.text "description"
    t.string "city"
    t.string "street"
    t.string "zip_code"
    t.float "latitude"
    t.float "longitude"
    t.float "price"
    t.float "avg_score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "nb_feedbacks", default: 0
    t.index ["user_id"], name: "index_locations_on_user_id"
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

  create_table "options", force: :cascade do |t|
    t.string "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "location_id", null: false
    t.float "price"
    t.datetime "date_in"
    t.datetime "date_out"
    t.integer "nb_people"
    t.string "stripe_reference"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_reservations_on_location_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "reservations_options", force: :cascade do |t|
    t.integer "reservation_id", null: false
    t.integer "option_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["option_id"], name: "index_reservations_options_on_option_id"
    t.index ["reservation_id"], name: "index_reservations_options_on_reservation_id"
  end

  create_table "user_favs", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_user_favs_on_location_id"
    t.index ["user_id"], name: "index_user_favs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "stripe"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean "is_host", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appliances", "categories"
  add_foreign_key "equipment", "categories"
  add_foreign_key "feedbacks", "reservations"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "location_appliances", "appliances"
  add_foreign_key "location_appliances", "locations"
  add_foreign_key "locations", "users"
  add_foreign_key "reservations", "locations"
  add_foreign_key "reservations", "users"
  add_foreign_key "reservations_options", "options"
  add_foreign_key "reservations_options", "reservations"
  add_foreign_key "user_favs", "locations"
  add_foreign_key "user_favs", "users"
end
