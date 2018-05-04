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

ActiveRecord::Schema.define(version: 20180503140915) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "annees", force: :cascade do |t|
    t.integer "cour_id"
    t.integer "teacher_id"
    t.integer "niveau", default: 0
  end

  create_table "correspondances", force: :cascade do |t|
    t.integer "niveau_id"
    t.string "nom"
  end

  create_table "cours", force: :cascade do |t|
    t.string "matiere"
    t.string "jour"
    t.integer "nombre_eleves", default: 0
    t.string "lieu"
    t.float "latitude"
    t.float "longitude"
    t.integer "teacher_id"
    t.integer "heure"
  end

  create_table "dispos", force: :cascade do |t|
    t.integer "cour_id"
    t.string "jour"
    t.integer "heure"
  end

  create_table "infoteachers", force: :cascade do |t|
    t.integer "teacher_id"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "location"
    t.string "experience"
    t.string "methodology"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "email"
  end

  create_table "infousers", force: :cascade do |t|
    t.integer "user_id"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "location"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "email"
    t.integer "niveau"
  end

  create_table "inscriptions", force: :cascade do |t|
    t.integer "cour_id"
    t.integer "user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "power", default: 0
  end

  create_table "teachers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
