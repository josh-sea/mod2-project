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

ActiveRecord::Schema.define(version: 2019_01_05_001736) do

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.integer "acct_num"
    t.integer "rep_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rep_id"], name: "index_accounts_on_rep_id"
  end

  create_table "inspections", force: :cascade do |t|
    t.string "model"
    t.string "reg_num"
    t.integer "system_id"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "basin_condition"
    t.string "tower_condition"
    t.string "fill_condition"
    t.datetime "inspection_date"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "system_id"
    t.integer "test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.integer "rep_id"
    t.integer "system_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reps", force: :cascade do |t|
    t.string "name"
    t.string "region"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "systems", force: :cascade do |t|
    t.string "system_type"
    t.string "treatment_comment"
    t.boolean "seasonal"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tests", force: :cascade do |t|
    t.string "name"
    t.float "reading"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
