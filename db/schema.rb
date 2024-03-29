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

ActiveRecord::Schema.define(version: 20171127164029) do

  create_table "checkouts", force: :cascade do |t|
    t.string   "email"
    t.string   "string"
    t.string   "phone_number"
    t.integer  "order_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "credit_card_number", limit: 25
    t.string   "expiration_date"
    t.integer  "security_code"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.float    "unit_price"
    t.integer  "quantity"
    t.float    "total_price"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.float    "size"
    t.integer  "length"
    t.float    "base_price_one"
    t.float    "base_price_oneofive"
    t.float    "base_price_two"
    t.float    "base_price_three"
    t.float    "base_price_twofive"
    t.float    "base_price_four"
  end

  create_table "orders", force: :cascade do |t|
    t.float    "subtotal"
    t.float    "total"
    t.float    "shopping"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.float    "price"
    t.integer  "length"
    t.float    "weight"
    t.string   "name"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "category"
    t.string   "subcategory"
    t.float    "price_per_size"
    t.float    "price_per_length"
    t.string   "constant_price"
    t.string   "float"
    t.float    "base_price_one"
    t.float    "base_price_oneofive"
    t.float    "base_price_two"
    t.float    "base_price_twofive"
    t.float    "base_price_three"
    t.float    "base_price_four"
    t.float    "additional_foot_price"
  end

  create_table "slides", force: :cascade do |t|
    t.string   "title"
    t.string   "product_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
