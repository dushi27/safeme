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

ActiveRecord::Schema.define(version: 20150604234910) do

  create_table "pubsubs", force: true do |t|
    t.string   "user_xid"
    t.string   "type"
    t.string   "action"
    t.string   "timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "xid"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "my_num"
    t.string   "e_num1"
    t.string   "e_num2"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "session"
    t.string   "email"
    t.string   "password"
  end

end
