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

ActiveRecord::Schema.define(version: 20151124162029) do

  create_table "course_registrations", force: :cascade do |t|
    t.integer  "courseid",   limit: 4
    t.integer  "studentid",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "course_registrations", ["courseid"], name: "fk_rails_86ff849801", using: :btree
  add_index "course_registrations", ["studentid"], name: "fk_rails_31ebd4584f", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "coursecode",   limit: 255
    t.string   "name",         limit: 255
    t.string   "description",  limit: 255
    t.integer  "instructorid", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "courses", ["instructorid"], name: "fk_rails_afadebda3c", using: :btree

  create_table "instructors", force: :cascade do |t|
    t.string   "employeeid", limit: 255
    t.string   "firstname",  limit: 255
    t.string   "lastname",   limit: 255
    t.string   "password",   limit: 255
    t.string   "email",      limit: 255
    t.string   "program",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "studentid",  limit: 255
    t.string   "password",   limit: 255
    t.string   "firstname",  limit: 255
    t.string   "lastname",   limit: 255
    t.string   "email",      limit: 255
    t.string   "program",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "team_collaborations", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.text     "description",           limit: 65535
    t.date     "dueDate"
    t.date     "teamFormationDeadline"
    t.integer  "maximumNumStudents",    limit: 4
    t.integer  "minimumNumStudents",    limit: 4
    t.integer  "courseid",              limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "team_collaborations", ["courseid"], name: "fk_rails_92a569e627", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.integer  "liaisonid",           limit: 4
    t.text     "listOfMembers",       limit: 65535
    t.text     "listOfCandidates",    limit: 65535
    t.integer  "numOfStudents",       limit: 4
    t.integer  "teamcollaborationid", limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "teams", ["liaisonid"], name: "fk_rails_c7796262bc", using: :btree
  add_index "teams", ["teamcollaborationid"], name: "fk_rails_c722ce7ccb", using: :btree

  add_foreign_key "course_registrations", "courses", column: "courseid"
  add_foreign_key "course_registrations", "students", column: "studentid"
  add_foreign_key "courses", "instructors", column: "instructorid"
  add_foreign_key "team_collaborations", "courses", column: "courseid"
  add_foreign_key "teams", "students", column: "liaisonid"
  add_foreign_key "teams", "team_collaborations", column: "teamcollaborationid"
end
