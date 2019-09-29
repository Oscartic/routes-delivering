# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_29_005700) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "communes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.integer "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loads", force: :cascade do |t|
    t.string "type_load"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.datetime "starts_at", null: false
    t.datetime "ends_at", null: false
    t.bigint "load_id"
    t.float "load_sum"
    t.integer "int_array", default: [], array: true
    t.integer "stops_amount"
    t.integer "vehicle_id"
    t.integer "driver_id"
    t.boolean "is_completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["load_id"], name: "index_routes_on_load_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "type_service"
    t.string "address"
    t.float "weight"
    t.bigint "commune_id"
    t.integer "route_id"
    t.bigint "load_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commune_id"], name: "index_services_on_commune_id"
    t.index ["load_id"], name: "index_services_on_load_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.bigint "load_id"
    t.integer "driver_id"
    t.float "capacity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["load_id"], name: "index_vehicles_on_load_id"
  end

  add_foreign_key "routes", "loads"
  add_foreign_key "services", "communes"
  add_foreign_key "services", "loads"
  add_foreign_key "vehicles", "loads"
end
