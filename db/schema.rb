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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130416224552) do

  create_table "categories", :force => true do |t|
    t.string   "name",       :limit => 45
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "tasks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "title"
    t.text     "content"
    t.integer  "is_complete",         :limit => 1
    t.integer  "is_starred",          :limit => 1
    t.string   "thumbnail_url"
    t.date     "due_date"
    t.integer  "priority",            :limit => 1
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "tasks", ["category_id"], :name => "index_tasks_on_category_id"
  add_index "tasks", ["user_id"], :name => "index_tasks_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "first_name",         :limit => 45
    t.string   "last_name",          :limit => 45
    t.string   "email"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.string   "encrypted_password", :limit => 45
    t.string   "password_salt",      :limit => 45
    t.string   "salt"
  end

end
