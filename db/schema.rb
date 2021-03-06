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

ActiveRecord::Schema.define(version: 20170709175257) do

  create_table "active_email_providers", force: :cascade do |t|
    t.string "name"
    t.text "api_params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bright_wheel_emails", force: :cascade do |t|
    t.string "to", limit: 191
    t.string "to_name"
    t.string "from", limit: 191
    t.string "from_name"
    t.string "subject"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "email_providers", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
