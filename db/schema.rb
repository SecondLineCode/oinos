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

ActiveRecord::Schema.define(version: 20150321014849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appellations", force: :cascade do |t|
    t.string   "app_name"
    t.string   "app_region"
    t.string   "app_area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "api_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "varietals", force: :cascade do |t|
    t.integer  "api_id"
    t.string   "varietal"
    t.string   "varietal_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "vineyards", force: :cascade do |t|
    t.string   "vineyard_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "api_id"
  end

  create_table "wines", force: :cascade do |t|
    t.integer  "vineyard_id"
    t.integer  "appellation_id"
    t.integer  "varietal_id"
    t.string   "name"
    t.string   "label_url"
    t.string   "api_url"
    t.float    "pricemin"
    t.float    "pricemax"
    t.string   "attributes"
    t.string   "sku"
    t.string   "api_provider"
    t.integer  "api_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "wines", ["appellation_id"], name: "index_wines_on_appellation_id", using: :btree
  add_index "wines", ["varietal_id"], name: "index_wines_on_varietal_id", using: :btree
  add_index "wines", ["vineyard_id"], name: "index_wines_on_vineyard_id", using: :btree

  add_foreign_key "wines", "appellations"
  add_foreign_key "wines", "varietals"
  add_foreign_key "wines", "vineyards"
end
