# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150604181056) do

  create_table "business_hours", force: :cascade do |t|
    t.integer  "company_branch_id"
    t.string   "day"
    t.time     "open_time"
    t.time     "close_time"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "company_branch_products", force: :cascade do |t|
    t.integer  "company_branch_id"
    t.integer  "product_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "company_branches", force: :cascade do |t|
    t.string   "name"
    t.string   "address_zip_code"
    t.string   "address_city"
    t.string   "address_line"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_ingredients", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "ingredient_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",      precision: 6, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

end
