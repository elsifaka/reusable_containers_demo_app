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

ActiveRecord::Schema.define(:version => 20120312091047) do

  create_table "blog_posts", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "containers", :force => true do |t|
    t.string   "name"
    t.string   "layout"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "entries", :force => true do |t|
    t.string   "name"
    t.string   "permalink"
    t.string   "title"
    t.string   "destination_action"
    t.integer  "destination_content_id"
    t.string   "destination_content_type"
    t.string   "container_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "path_cache"
  end

  create_table "navigation_entries", :force => true do |t|
    t.integer  "navigation_id"
    t.integer  "entry_id"
    t.integer  "position"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "navigation_entries", ["entry_id"], :name => "index_navigation_entries_on_entry_id"
  add_index "navigation_entries", ["navigation_id"], :name => "index_navigation_entries_on_navigation_id"

  create_table "navigations", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
