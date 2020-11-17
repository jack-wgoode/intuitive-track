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

ActiveRecord::Schema.define(version: 20201116031126) do

  create_table "end_users", force: :cascade do |t|
    t.string   "name"
    t.string   "employee_number"
    t.string   "department"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "technicians", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "tech_number"
    t.string   "department"
    t.string   "cert_level"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "full_name"
    t.string   "uid"
    t.string   "avatar_url"
    t.index ["email"], name: "index_technicians_on_email", unique: true
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "ticket_number"
    t.string   "asset"
    t.text     "issue"
    t.string   "priority"
    t.integer  "technician_id"
    t.integer  "end_user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["end_user_id"], name: "index_tickets_on_end_user_id"
    t.index ["technician_id"], name: "index_tickets_on_technician_id"
  end

end
