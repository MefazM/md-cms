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

ActiveRecord::Schema.define(version: 20140213132054) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "authentications", force: true do |t|
    t.integer "player_id"
    t.string  "provider"
    t.string  "token"
  end

  create_table "buildings", force: true do |t|
    t.string  "name"
    t.string  "description"
    t.integer "level"
    t.string  "uid"
    t.integer "production_time"
    t.integer "price"
    t.integer "points"
  end

  add_index "buildings", ["level", "uid"], name: "index_buildings_on_level_and_uid", unique: true, using: :btree

  create_table "deferred_tasks", force: true do |t|
    t.integer "user_id"
    t.integer "finish_time"
    t.integer "production_time"
    t.integer "resource_id"
    t.string  "package"
    t.integer "level"
  end

  add_index "deferred_tasks", ["user_id", "resource_id"], name: "user_id", unique: true, using: :btree

  create_table "deferred_tasks_with_sequences", force: true do |t|
    t.integer "producer_id"
    t.integer "production_time"
    t.string  "resource_id",     limit: 32
    t.integer "player_id"
  end

  create_table "device_errors", force: true do |t|
    t.text     "error_message"
    t.text     "stack_trace"
    t.string   "memory"
    t.string   "model"
    t.string   "name"
    t.string   "architecture_info"
    t.string   "app_version_string"
    t.string   "max_texture_size"
    t.string   "platform_name"
    t.boolean  "unread",             default: true
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "game_settings", force: true do |t|
    t.text   "value"
    t.string "key"
  end

  create_table "players", force: true do |t|
    t.string "email"
    t.string "username"
  end

  create_table "spells", force: true do |t|
    t.string  "uid"
    t.integer "time"
    t.integer "value"
    t.text    "description"
    t.float   "area"
    t.string  "target_type"
    t.integer "mana_cost"
    t.string  "ability_preset"
    t.string  "processing_type"
  end

  add_index "spells", ["uid"], name: "index_spells_on_uid", unique: true, using: :btree

  create_table "units", force: true do |t|
    t.string   "uid"
    t.string   "name"
    t.string   "description"
    t.float    "movement_speed"
    t.integer  "melee_attack_speed"
    t.integer  "melee_attack_power_min"
    t.float    "melee_attack_range"
    t.integer  "health_points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "melee_attack_power_max"
    t.boolean  "range_attack",              default: false
    t.boolean  "melee_attack",              default: false
    t.integer  "range_attack_power_max"
    t.integer  "range_attack_power_min"
    t.float    "range_attack_range"
    t.integer  "range_attack_speed"
    t.integer  "resist_type"
    t.integer  "melee_attack_damage_type"
    t.integer  "range_attack_damage_type"
    t.string   "depends_on_building_uid"
    t.integer  "depends_on_building_level"
    t.integer  "production_time"
    t.integer  "price"
  end

  add_index "units", ["name"], name: "index_units_on_name", unique: true, using: :btree
  add_index "units", ["uid"], name: "index_units_on_uid", unique: true, using: :btree

end
