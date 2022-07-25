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

ActiveRecord::Schema[7.0].define(version: 2022_07_23_095724) do
  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "executors", force: :cascade do |t|
    t.string "fio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_categories", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_order_categories_on_category_id"
    t.index ["order_id", "category_id"], name: "index_order_categories_on_order_id_and_category_id", unique: true
    t.index ["order_id"], name: "index_order_categories_on_order_id"
  end

  create_table "order_services", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "service_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id", "service_id"], name: "index_order_services_on_order_id_and_service_id", unique: true
    t.index ["order_id"], name: "index_order_services_on_order_id"
    t.index ["service_id"], name: "index_order_services_on_service_id"
  end

  create_table "order_staffs", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "staff_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id", "staff_id"], name: "index_order_staffs_on_order_id_and_staff_id", unique: true
    t.index ["order_id"], name: "index_order_staffs_on_order_id"
    t.index ["staff_id"], name: "index_order_staffs_on_staff_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "order_categories", "categories"
  add_foreign_key "order_categories", "orders"
  add_foreign_key "order_services", "orders"
  add_foreign_key "order_services", "services"
  add_foreign_key "order_staffs", "orders"
  add_foreign_key "order_staffs", "staffs"
end
