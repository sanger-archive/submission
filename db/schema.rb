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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110208092802) do

  create_table "local_submissions", :force => true do |t|
    t.string   "uuid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "local_submissions", ["uuid"], :name => "index_local_submissions_on_uuid"

  create_table "projects", :force => true do |t|
    t.string   "uuid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["name"], :name => "index_projects_on_name"
  add_index "projects", ["uuid"], :name => "index_projects_on_uuid"

  create_table "studies", :force => true do |t|
    t.string   "uuid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "studies", ["name"], :name => "index_studies_on_name"
  add_index "studies", ["uuid"], :name => "index_studies_on_uuid"

  create_table "submission_templates", :force => true do |t|
    t.string   "uuid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "submission_templates", ["name"], :name => "index_submission_templates_on_name"
  add_index "submission_templates", ["uuid"], :name => "index_submission_templates_on_uuid"

end
