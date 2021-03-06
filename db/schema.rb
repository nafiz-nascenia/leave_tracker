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

ActiveRecord::Schema.define(version: 20151223050421) do

  create_table "allowed_users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "days", force: :cascade do |t|
    t.integer  "holiday_id"
    t.date     "the_date"
    t.decimal  "hours",      precision: 2, scale: 1, default: 8.0
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "days", ["holiday_id"], name: "index_days_on_holiday_id"

  create_table "holidays", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "reason"
    t.text     "description"
    t.string   "holiday_type", default: "casual"
    t.string   "status",       default: "pending"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.text     "feedback"
  end

  add_index "holidays", ["user_id"], name: "index_holidays_on_user_id"

  create_table "stats", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "yearly_casual_leave",   default: 10
    t.integer  "yearly_sick_leave",     default: 6
    t.decimal  "carried_leave",         default: 0.0
    t.decimal  "consumed_casual_leave", default: 0.0
    t.decimal  "consumed_sick_leave",   default: 0.0
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.date     "commence_date"
  end

  add_index "stats", ["user_id"], name: "index_stats_on_user_id"

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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "role"
    t.boolean  "admin"
    t.integer  "ttf_id"
    t.integer  "sttf_id"
    t.string   "provider"
    t.string   "uid"
    t.date     "joining_date"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
