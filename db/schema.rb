# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_17_034706) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmark_embassies", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "embassy_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["embassy_id"], name: "index_bookmark_embassies_on_embassy_id"
    t.index ["user_id"], name: "index_bookmark_embassies_on_user_id"
  end

  create_table "bookmark_visa_results", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "visa_result_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_bookmark_visa_results_on_user_id"
    t.index ["visa_result_id"], name: "index_bookmark_visa_results_on_visa_result_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "alpha2code"
    t.string "capital"
    t.string "timezones"
    t.string "languages"
    t.string "flag"
    t.string "currencies"
    t.string "demonym"
    t.string "latlng"
    t.integer "callingCodes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "embassies", force: :cascade do |t|
    t.string "in_city"
    t.string "embassy_hijo_h3"
    t.string "embassy_consulate"
    t.string "address"
    t.string "address_link_gmaps"
    t.string "emails"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "countries_id"
    t.float "latitude"
    t.float "longitude"
    t.bigint "own_country_id", null: false
    t.bigint "host_country_id", null: false
    t.index ["countries_id"], name: "index_embassies_on_countries_id"
    t.index ["host_country_id"], name: "index_embassies_on_host_country_id"
    t.index ["own_country_id"], name: "index_embassies_on_own_country_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visa_results", force: :cascade do |t|
    t.string "visa_modality"
    t.string "evisa_modality"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "origin_country_id", null: false
    t.bigint "destination_country_id", null: false
    t.index ["destination_country_id"], name: "index_visa_results_on_destination_country_id"
    t.index ["origin_country_id"], name: "index_visa_results_on_origin_country_id"
  end

  add_foreign_key "bookmark_embassies", "embassies"
  add_foreign_key "bookmark_embassies", "users"
  add_foreign_key "bookmark_visa_results", "users"
  add_foreign_key "bookmark_visa_results", "visa_results"
  add_foreign_key "embassies", "countries", column: "countries_id"
  add_foreign_key "embassies", "countries", column: "host_country_id"
  add_foreign_key "embassies", "countries", column: "own_country_id"
  add_foreign_key "visa_results", "countries", column: "destination_country_id"
  add_foreign_key "visa_results", "countries", column: "origin_country_id"
end
