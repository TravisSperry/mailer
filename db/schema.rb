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

ActiveRecord::Schema.define(version: 20160513151923) do

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
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "organization"
    t.string   "dates"
    t.string   "link"
    t.integer  "newsletter_id"
  end

  create_table "expo_registrations", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "year"
    t.boolean  "newsletter"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "qr_code"
    t.string   "qr_code_uid"
    t.boolean  "checked_in",    default: false
    t.date     "checked_in_at"
    t.boolean  "follow_up",     default: false
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

  create_table "newsletters", force: true do |t|
    t.integer  "month"
    t.integer  "year"
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
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
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
    t.integer  "year",                default: 0
    t.string   "confirmation_code"
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

  create_table "vendor_registrations", force: true do |t|
    t.string   "organization_name"
    t.string   "contact"
    t.string   "email"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "ages"
    t.boolean  "registration_fee"
    t.boolean  "late_fee"
    t.boolean  "ad_fee"
    t.integer  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "year"
    t.string   "vendor_stripe_card_token"
    t.string   "stripe_charge_token"
    t.boolean  "pay_by_check",             default: false
    t.boolean  "paid",                     default: false
  end

end
