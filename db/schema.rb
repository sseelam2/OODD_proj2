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

ActiveRecord::Schema.define(version: 2018_10_10_214129) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

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
    t.integer "rent"
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

  create_table "searches", force: :cascade do |t|
    t.text "location"
    t.integer "min_sq_ft"
    t.integer "max_sq_ft"
    t.integer "min_price"
    t.integer "max_price"
  end

end
