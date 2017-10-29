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

ActiveRecord::Schema.define(version: 20171029155332) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guests", force: :cascade do |t|
    t.string   "first_name1"
    t.string   "last_name1"
    t.string   "first_name2"
    t.string   "last_name2"
    t.string   "code"
    t.string   "food_option1"
    t.string   "food_option2"
    t.string   "housing"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "role"
    t.boolean  "rsvped",               default: false
    t.string   "email"
    t.boolean  "attending"
    t.string   "fact"
    t.boolean  "friday_attending"
    t.string   "interesting_fact_two"
    t.string   "second_email"
  end

end
