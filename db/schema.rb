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

ActiveRecord::Schema.define(version: 20171102012036) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alerts", force: :cascade do |t|
    t.integer "price"
    t.integer "coin_id"
    t.boolean "triggered"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "current_price", precision: 7, scale: 3
  end

  create_table "coins", force: :cascade do |t|
    t.string "ticker"
    t.string "name"
    t.decimal "current_price", precision: 7, scale: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "supply"
    t.string "contract_address"
    t.integer "wallet_id"
  end

  create_table "trades", force: :cascade do |t|
    t.integer "execution_price"
    t.integer "quantity"
    t.string "direction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "timestamp"
    t.integer "coin_id"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wallets", force: :cascade do |t|
    t.string "address"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "eth_balance", precision: 10, scale: 3
  end

end
