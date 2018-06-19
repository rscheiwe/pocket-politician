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

ActiveRecord::Schema.define(version: 20180619190901) do

  create_table "bills", force: :cascade do |t|
    t.string "description"
    t.integer "representative_id"
    t.integer "pass_fail_bill_id"
  end

  create_table "pass_fail_bills", force: :cascade do |t|
    t.integer "politician_id"
    t.integer "bill_id"
  end

  create_table "politicians", force: :cascade do |t|
    t.string "name"
    t.string "party"
    t.string "office"
    t.string "gender"
    t.string "cid"
  end

  create_table "representatives", force: :cascade do |t|
    t.string "name"
    t.string "party"
    t.string "office"
    t.integer "money"
    t.string "cid"
  end

end
