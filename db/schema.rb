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

ActiveRecord::Schema.define(version: 20161121195839) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alerts", force: :cascade do |t|
    t.integer  "patient_id"
    t.integer  "drug_id"
    t.datetime "time"
    t.integer  "prescription_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "drug_prescriptions", force: :cascade do |t|
    t.integer  "drug_id"
    t.integer  "prescription_id"
    t.integer  "refill"
    t.integer  "frequency"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "drugs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "medical_history"
    t.string   "height"
    t.string   "weight"
    t.string   "health_history"
    t.string   "phone_number"
    t.string   "address"
    t.integer  "age"
    t.string   "sex"
    t.string   "email"
    t.string   "note"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "dob"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.integer  "patient_id"
    t.string   "experition_date"
    t.boolean  "active",           default: true
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "notes"
    t.string   "pharmacy_name"
    t.string   "pharmacy_address"
    t.string   "diagnosis"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.string   "phone_number"
    t.string   "address"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
