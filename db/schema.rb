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

ActiveRecord::Schema.define(version: 20131021024322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "questions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responders", force: true do |t|
    t.string   "ip_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responses", force: true do |t|
    t.string   "text"
    t.integer  "question_id"
    t.integer  "responder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "up_votes", force: true do |t|
    t.integer  "response_id"
    t.integer  "responder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "responses", "questions", name: "responses_question_id_fk"
  add_foreign_key "responses", "responders", name: "responses_responder_id_fk"

  add_foreign_key "up_votes", "responders", name: "up_votes_responder_id_fk"
  add_foreign_key "up_votes", "responses", name: "up_votes_response_id_fk"

end
