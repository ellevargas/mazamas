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

ActiveRecord::Schema.define(version: 20170113000208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"


  create_enum "climb_month", "january", "february", "march", "april", "may", "june", "july", "august", "september,october", "november", "december"
  create_enum "climb_status", "unpublished", "open", "full", "waitlist", "cancelled", "completed"
  create_enum "climb_type", "mazamas", "private", "other"
  create_enum "membership_status", "nonmember", "active", "lapsed"
  create_enum "registration_status", "applied", "accepted", "rejected", "waitlist", "leader", "assistant"
  create_enum "snow_angle", "notapplicable", "35to50", "over50", "upto35"
  create_enum "typical_gear", "snow", "scramble", "rock", "rockandsnow"
  create_enum "typical_season", "springsummer", "summerautumn"
  create_table "climb_classes", force: :cascade do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  :null=>false
    t.datetime "updated_at",  :null=>false
  end

  create_table "climb_leader_profiles", force: :cascade do |t|
    t.integer  "climbing_since"
    t.integer  "leader_since"
    t.integer  "pace"
    t.text     "climb_preferences"
    t.text     "volunteer_history"
    t.text     "climb_achievements"
    t.text     "climb_philosophy"
    t.text     "summit_treat"
    t.datetime "created_at",         :null=>false
    t.datetime "updated_at",         :null=>false
    t.string   "photo_link"
    t.string   "bio"
    t.integer  "user_id"
  end
  add_index "climb_leader_profiles", ["user_id"], :name=>"index_climb_leader_profiles_on_user_id", :using=>:btree

  create_table "climb_schedules", force: :cascade do |t|
    t.string   "season"
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
    t.integer  "year"
  end

  create_table "climb_tags", force: :cascade do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  :null=>false
    t.datetime "updated_at",  :null=>false
  end

  create_table "climb_tags_climbs", id: false, force: :cascade do |t|
    t.integer "climb_tag_id", :null=>false
    t.integer "climb_id",     :null=>false
  end
  add_index "climb_tags_climbs", ["climb_id", "climb_tag_id"], :name=>"index_climb_tags_climbs_on_climb_id_and_climb_tag_id", :using=>:btree
  add_index "climb_tags_climbs", ["climb_tag_id", "climb_id"], :name=>"index_climb_tags_climbs_on_climb_tag_id_and_climb_id", :using=>:btree

  create_table "climber_educations", force: :cascade do |t|
    t.integer  "year"
    t.string   "leader"
    t.datetime "created_at",           :null=>false
    t.datetime "updated_at",           :null=>false
    t.integer  "education_program_id"
    t.integer  "user_id"
  end
  add_index "climber_educations", ["education_program_id"], :name=>"index_climber_educations_on_education_program_id", :using=>:btree
  add_index "climber_educations", ["user_id"], :name=>"index_climber_educations_on_user_id", :using=>:btree

# Could not dump table "climber_experiences" because of following StandardError
#   Unknown type 'climb_type' for column 'climb_type'


  create_table "climber_profiles", force: :cascade do |t|
    t.text     "bio"
    t.text     "volunteer_history"
    t.text     "physical_conditioning"
    t.text     "medical_condition"
    t.text     "medication"
    t.datetime "created_at",            :null=>false
    t.datetime "updated_at",            :null=>false
    t.integer  "user_id"
  end
  add_index "climber_profiles", ["user_id"], :name=>"index_climber_profiles_on_user_id", :using=>:btree

# Could not dump table "climbs" because of following StandardError
#   Unknown type 'climb_status' for column 'climb_status'


  create_table "climbs_grad_prefs", id: false, force: :cascade do |t|
    t.integer "grad_pref_id", :null=>false
    t.integer "climb_id",     :null=>false
  end
  add_index "climbs_grad_prefs", ["climb_id", "grad_pref_id"], :name=>"index_climbs_grad_prefs_on_climb_id_and_grad_pref_id", :using=>:btree
  add_index "climbs_grad_prefs", ["grad_pref_id", "climb_id"], :name=>"index_climbs_grad_prefs_on_grad_pref_id_and_climb_id", :using=>:btree

  create_table "climbs_registrations", id: false, force: :cascade do |t|
    t.integer "registration_id", :null=>false
    t.integer "climb_id",        :null=>false
  end
  add_index "climbs_registrations", ["climb_id", "registration_id"], :name=>"index_climbs_registrations_on_climb_id_and_registration_id", :using=>:btree
  add_index "climbs_registrations", ["registration_id", "climb_id"], :name=>"index_climbs_registrations_on_registration_id_and_climb_id", :using=>:btree

  create_table "education_programs", force: :cascade do |t|
    t.string   "abbreviation"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",   :null=>false
    t.datetime "updated_at",   :null=>false
  end

# Could not dump table "general_dates" because of following StandardError
#   Unknown type 'climb_month' for column 'climb_month'


  create_table "grad_prefs", force: :cascade do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  :null=>false
    t.datetime "updated_at",  :null=>false
  end

  create_table "mountains", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",       :null=>false
    t.datetime "updated_at",       :null=>false
    t.string   "latitude"
    t.string   "longitude"
    t.string   "state"
    t.string   "country"
    t.string   "continent"
    t.string   "summit_post_url"
    t.string   "google_maps_url"
    t.string   "elevation_feet"
    t.string   "elevation_meters"
    t.string   "summit_post_name"
  end

# Could not dump table "registrations" because of following StandardError
#   Unknown type 'registration_status' for column 'registration_status'


# Could not dump table "routes" because of following StandardError
#   Unknown type 'typical_season' for column 'typical_season'


  create_table "specific_dates", force: :cascade do |t|
    t.date     "date_leave_town"
    t.date     "date_leave_trailhead"
    t.date     "date_summit"
    t.date     "date_return_trailhead"
    t.date     "date_return_town"
    t.datetime "created_at",            :null=>false
    t.datetime "updated_at",            :null=>false
  end

  create_table "user_roles", force: :cascade do |t|
    t.string   "role"
    t.string   "description"
    t.datetime "created_at",  :null=>false
    t.datetime "updated_at",  :null=>false
  end

  create_table "user_roles_users", id: false, force: :cascade do |t|
    t.integer "user_role_id", :null=>false
    t.integer "user_id",      :null=>false
  end
  add_index "user_roles_users", ["user_id", "user_role_id"], :name=>"index_user_roles_users_on_user_id_and_user_role_id", :using=>:btree
  add_index "user_roles_users", ["user_role_id", "user_id"], :name=>"index_user_roles_users_on_user_role_id_and_user_id", :using=>:btree

# Could not dump table "users" because of following StandardError
#   Unknown type 'membership_status' for column 'membership_status'


  add_foreign_key "climb_leader_profiles", "users"
  add_foreign_key "climber_educations", "education_programs"
  add_foreign_key "climber_educations", "users"
  add_foreign_key "climber_profiles", "users"
  add_foreign_key "climbs", "climb_schedules"
  add_foreign_key "climbs", "climb_tags"
  add_foreign_key "climbs", "general_dates"
  add_foreign_key "climbs", "routes"
  add_foreign_key "climbs", "specific_dates"
  add_foreign_key "routes", "climb_classes"
  add_foreign_key "routes", "mountains"
  add_foreign_key "users", "climb_leader_profiles"
  add_foreign_key "users", "climber_profiles"
end
