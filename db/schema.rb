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

ActiveRecord::Schema.define(version: 20150717001606) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attends", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "schedule_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "attends", ["schedule_id"], name: "index_attends_on_schedule_id", using: :btree
  add_index "attends", ["user_id"], name: "index_attends_on_user_id", using: :btree

  create_table "cards", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "idm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cards", ["user_id"], name: "index_cards_on_user_id", using: :btree

  create_table "schedules", force: :cascade do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "place"
    t.string   "caption"
    t.date     "scheduled_date"
    t.integer  "assigned_user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "sid",                                 null: false
    t.string   "name",                   default: "", null: false
    t.integer  "laboratory",             default: 0,  null: false
    t.integer  "position",               default: 0,  null: false
    t.string   "phone",                  default: "", null: false
    t.string   "address"
    t.datetime "birthday"
    t.integer  "role",                   default: 0,  null: false
    t.integer  "status",                 default: 0,  null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["sid"], name: "index_users_on_sid", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
