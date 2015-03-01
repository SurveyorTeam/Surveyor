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

ActiveRecord::Schema.define(version: 20150301180431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "projects", force: :cascade do |t|
    t.integer  "researcher_id"
    t.string   "project_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["researcher_id"], name: "index_projects_on_researcher_id", using: :btree

  create_table "research_subjects", force: :cascade do |t|
    t.string   "first_name",             default: "", null: false
    t.string   "last_name",              default: "", null: false
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
    t.integer  "age"
    t.integer  "education_level"
    t.integer  "income"
    t.string   "state"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "research_subjects", ["email"], name: "index_research_subjects_on_email", unique: true, using: :btree
  add_index "research_subjects", ["reset_password_token"], name: "index_research_subjects_on_reset_password_token", unique: true, using: :btree

  create_table "researchees", force: :cascade do |t|
    t.string   "first_name",             default: "", null: false
    t.string   "last_name",              default: "", null: false
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
    t.string   "gender"
    t.string   "state"
    t.integer  "age"
    t.integer  "income"
    t.integer  "education_level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "researchees", ["email"], name: "index_researchees_on_email", unique: true, using: :btree
  add_index "researchees", ["reset_password_token"], name: "index_researchees_on_reset_password_token", unique: true, using: :btree

  create_table "researchers", force: :cascade do |t|
    t.string   "first_name",             default: "", null: false
    t.string   "last_name",              default: "", null: false
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
    t.string   "organization"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "researchers", ["email"], name: "index_researchers_on_email", unique: true, using: :btree
  add_index "researchers", ["reset_password_token"], name: "index_researchers_on_reset_password_token", unique: true, using: :btree

  create_table "surveys", force: :cascade do |t|
    t.integer  "projects_id"
    t.string   "survey_name"
    t.string   "survey_question"
    t.string   "survey_image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "surveys", ["projects_id"], name: "index_surveys_on_projects_id", using: :btree

end
