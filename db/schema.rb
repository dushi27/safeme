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

ActiveRecord::Schema.define(version: 20150824013927) do

  create_table "jawbones", force: true do |t|
    t.string   "user_xid"
    t.string   "jawbone_type"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "data"
    t.string   "event_xid"
    t.string   "timestamp"
    t.boolean  "responded"
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
