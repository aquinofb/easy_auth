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

ActiveRecord::Schema.define(version: 20160224004802) do

  create_table "easy_auth_authorizations", force: :cascade do |t|
    t.integer  "role_id"
    t.integer  "group_id"
    t.integer  "authorizable_id"
    t.string   "authorizable_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "easy_auth_authorizations", ["authorizable_id"], name: "index_easy_auth_authorizable_id"
  add_index "easy_auth_authorizations", ["group_id"], name: "index_easy_auth_group_id"
  add_index "easy_auth_authorizations", ["role_id"], name: "index_easy_auth_role_id"

  create_table "easy_auth_features", force: :cascade do |t|
    t.string   "namespace"
    t.string   "controller"
    t.string   "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "easy_auth_features_roles", force: :cascade do |t|
    t.integer  "role_id"
    t.integer  "feature_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "easy_auth_features_roles", ["feature_id"], name: "index_easy_auth_features_roles_on_feature_id"
  add_index "easy_auth_features_roles", ["role_id"], name: "index_easy_auth_features_roles_on_role_id"

  create_table "easy_auth_roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
