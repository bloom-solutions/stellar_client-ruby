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

ActiveRecord::Schema.define(version: 2019_08_08_072946) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stellar_base_account_subscriptions", force: :cascade do |t|
    t.string "address", null: false
    t.string "cursor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_stellar_base_account_subscriptions_on_address", unique: true
  end

  create_table "stellar_base_bridge_callbacks", force: :cascade do |t|
    t.string "operation_id", null: false
    t.string "from", null: false
    t.string "route"
    t.decimal "amount", null: false
    t.string "asset_code"
    t.string "asset_issuer"
    t.string "memo_type"
    t.string "memo"
    t.string "data"
    t.string "transaction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_code", "asset_issuer"], name: "index_stellar_base_bridge_callbacks_on_asset"
    t.index ["memo"], name: "index_stellar_base_bridge_callbacks_on_memo"
    t.index ["operation_id"], name: "index_stellar_base_bridge_callbacks_on_operation_id", unique: true
    t.index ["transaction_id"], name: "index_stellar_base_bridge_callbacks_on_transaction_id"
  end

  create_table "stellar_base_deposit_requests", force: :cascade do |t|
    t.string "asset_type", null: false
    t.string "asset_code", null: false
    t.string "memo_type"
    t.string "memo"
    t.string "account_id", null: false
    t.string "issuer", null: false
    t.string "email_address"
    t.string "deposit_address", null: false
    t.string "deposit_type"
    t.integer "eta"
    t.decimal "min_amount", default: "0.0", null: false
    t.decimal "max_amount"
    t.decimal "fee_fixed", default: "0.0", null: false
    t.decimal "fee_percent", default: "0.0", null: false
    t.string "extra_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_type", "asset_code"], name: "index_stellar_base_deposit_requests_on_asset"
  end

  create_table "stellar_base_deposits", force: :cascade do |t|
    t.integer "deposit_request_id"
    t.string "tx_id"
    t.decimal "amount"
    t.string "stellar_tx_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deposit_request_id", "tx_id"], name: "index_stellar_base_deposits_on_deposit_request_id_and_tx_id", unique: true
    t.index ["deposit_request_id"], name: "index_stellar_base_deposits_on_deposit_request_id"
    t.index ["tx_id"], name: "index_stellar_base_deposits_on_tx_id"
  end

  create_table "stellar_base_stellar_operations", force: :cascade do |t|
    t.string "operation_id", null: false
    t.string "transaction_hash", null: false
    t.string "type"
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["operation_id"], name: "index_stellar_base_stellar_operations_on_operation_id", unique: true
  end

  create_table "stellar_base_stellar_transactions", force: :cascade do |t|
    t.string "transaction_id", null: false
    t.string "memo"
    t.string "memo_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["memo"], name: "index_stellar_base_stellar_transactions_on_memo"
    t.index ["transaction_id"], name: "index_stellar_base_stellar_transactions_on_transaction_id", unique: true
  end

  create_table "stellar_base_withdrawal_requests", force: :cascade do |t|
    t.string "asset_type", null: false
    t.string "asset_code", null: false
    t.string "dest", null: false
    t.string "issuer", null: false
    t.string "dest_extra"
    t.string "account_id"
    t.string "memo_type"
    t.string "memo"
    t.integer "eta"
    t.decimal "min_amount", default: "0.0", null: false
    t.decimal "max_amount"
    t.decimal "fee_fixed", default: "0.0", null: false
    t.decimal "fee_percent", default: "0.0", null: false
    t.string "extra_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_type", "asset_code"], name: "index_stellar_base_withdrawal_requests_on_asset"
  end

  add_foreign_key "stellar_base_deposits", "stellar_base_deposit_requests", column: "deposit_request_id"
end
