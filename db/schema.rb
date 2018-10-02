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

ActiveRecord::Schema.define(version: 2018_10_01_010418) do

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "email"
  end

  create_table "companies", force: :cascade do |t|
    t.string "company_id"
    t.string "name"
    t.string "website"
    t.text "address"
    t.integer "size"
    t.integer "founded"
    t.integer "revenue"
    t.text "synopsis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "house_hunters", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "name"
    t.string "preferred_contact"
    t.integer "phoneNumber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "houses", force: :cascade do |t|
    t.text "address"
    t.string "company_id"
    t.string "realtor_id"
    t.string "sq_ft"
    t.string "style"
    t.integer "year"
    t.binary "basement"
    t.integer "floor"
  end

  create_table "messages", force: :cascade do |t|
    t.text "query"
    t.string "house_hunter_id"
    t.string "subject"
    t.text "reply"
    t.string "house_id"
    t.string "companyId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string "name", null: false
    t.binary "data", null: false
    t.string "filename"
    t.string "mime_type"
    t.string "house_id"
  end

  create_table "realtors", force: :cascade do |t|
    t.text "email"
    t.string "name"
    t.text "password"
    t.string "companyId"
    t.integer "phoneNumber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
