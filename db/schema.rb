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

ActiveRecord::Schema.define(version: 20161121002622) do

  create_table "api_keys", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "access_token"
    t.string   "scope"
    t.datetime "expired_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "nurse_availabilities", force: :cascade do |t|
    t.integer  "nurse_id"
    t.date     "available_date"
    t.time     "available_time1"
    t.time     "available_time2"
    t.time     "available_time3"
    t.time     "available_time4"
    t.time     "available_time5"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "nurse_details", force: :cascade do |t|
    t.integer  "nurse_id"
    t.integer  "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "patient_id"
    t.time     "preferred_time1"
    t.time     "preferred_time2"
    t.time     "preferred_time3"
    t.date     "preferred_date"
    t.string   "preferred_location"
    t.integer  "service_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "username"
    t.string   "password"
    t.string   "gender"
    t.string   "language"
    t.string   "address"
    t.string   "status"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
