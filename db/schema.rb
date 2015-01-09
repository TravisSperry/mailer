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

ActiveRecord::Schema.define(version: 20150109172037) do

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

# Could not dump table "contacts" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "events", force: true do |t|
    t.string   "title"
    t.string   "contact"
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.text     "description"
    t.string   "cost"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.date     "date"
    t.string   "organization"
    t.boolean  "approved"
    t.string   "age"
    t.string   "email"
  end

  create_table "expo_registrations", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "year"
    t.boolean  "newsletter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mailer_events", force: true do |t|
    t.string   "name"
    t.string   "company"
    t.string   "date"
    t.string   "description"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parents", force: true do |t|
    t.integer  "registration_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role"
    t.string   "email"
    t.string   "volunteer"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "registrations", force: true do |t|
    t.integer  "event_id"
    t.string   "school_name"
    t.integer  "student_count"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.text     "comment"
    t.boolean  "volunteer"
    t.boolean  "fee_waiver"
    t.boolean  "consent"
    t.text     "comments"
    t.string   "stripe_card_token"
    t.integer  "total"
    t.string   "stripe_charge_token"
    t.string   "contact_email"
    t.boolean  "cosi_member"
  end

  create_table "students", force: true do |t|
    t.integer  "registration_id"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "grade"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
