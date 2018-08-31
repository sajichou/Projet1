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

ActiveRecord::Schema.define(version: 20180830200424) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "absences", force: :cascade do |t|
    t.integer "user_id"
    t.integer "cour_id"
    t.string "date"
    t.datetime "deleted_at"
  end

  create_table "alertes", force: :cascade do |t|
    t.integer "lesson_id"
    t.boolean "error"
  end

  create_table "annees", force: :cascade do |t|
    t.integer "cour_id"
    t.integer "teacher_id"
    t.integer "niveau", default: 0
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_annees_on_deleted_at"
  end

  create_table "articles", force: :cascade do |t|
    t.string "titre"
    t.text "contenu"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "accroche"
    t.string "date"
  end

  create_table "commentaires", force: :cascade do |t|
    t.integer "user_id"
    t.integer "cour_id"
    t.string "contenu"
    t.string "date"
    t.datetime "created_at"
  end

  create_table "contactmessages", force: :cascade do |t|
    t.integer "cour_id"
    t.integer "user_id"
    t.text "message"
    t.datetime "created_at"
    t.integer "teacher_id"
    t.boolean "ecritparuser"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_contactmessages_on_deleted_at"
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
    t.string "date_reg"
    t.string "date_ex"
    t.string "horaire_ex"
    t.integer "min", default: 0
    t.integer "min_ex", default: 0
    t.string "titre"
    t.string "descriptif"
    t.string "street_number"
    t.string "route"
    t.string "postal_code"
    t.string "locality"
    t.string "country"
    t.string "lieu_court"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_cours_on_deleted_at"
  end

  create_table "demandes", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "cour_id"
    t.integer "user_id"
    t.string "jour"
    t.integer "heure"
    t.integer "min"
    t.boolean "state"
    t.datetime "created_at"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_demandes_on_deleted_at"
  end

  create_table "dispos", force: :cascade do |t|
    t.integer "cour_id"
    t.string "jour"
    t.integer "heure"
    t.integer "min", default: 0
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_dispos_on_deleted_at"
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
    t.string "stripe_id"
    t.float "latitude"
    t.float "longitude"
    t.boolean "cgu"
    t.integer "dossier", default: 0
    t.string "dptm"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_infoteachers_on_deleted_at"
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
    t.string "stripe_customer_id"
    t.string "code"
    t.boolean "code_used", default: false
    t.boolean "cgu"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_infousers_on_deleted_at"
  end

  create_table "inscriptions", force: :cascade do |t|
    t.integer "cour_id"
    t.integer "user_id"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_inscriptions_on_deleted_at"
  end

  create_table "lessons", force: :cascade do |t|
    t.integer "cour_id"
    t.string "date"
    t.integer "complaints"
    t.boolean "in_fav_of_users"
    t.boolean "paid"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_lessons_on_deleted_at"
  end

  create_table "mailboxer_conversation_opt_outs", id: :serial, force: :cascade do |t|
    t.string "unsubscriber_type"
    t.integer "unsubscriber_id"
    t.integer "conversation_id"
    t.index ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id"
    t.index ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type"
  end

  create_table "mailboxer_conversations", id: :serial, force: :cascade do |t|
    t.string "subject", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mailboxer_notifications", id: :serial, force: :cascade do |t|
    t.string "type"
    t.text "body"
    t.string "subject", default: ""
    t.string "sender_type"
    t.integer "sender_id"
    t.integer "conversation_id"
    t.boolean "draft", default: false
    t.string "notification_code"
    t.string "notified_object_type"
    t.integer "notified_object_id"
    t.string "attachment"
    t.datetime "updated_at", null: false
    t.datetime "created_at", null: false
    t.boolean "global", default: false
    t.datetime "expires"
    t.index ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id"
    t.index ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type"
    t.index ["notified_object_type", "notified_object_id"], name: "mailboxer_notifications_notified_object"
    t.index ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type"
    t.index ["type"], name: "index_mailboxer_notifications_on_type"
  end

  create_table "mailboxer_receipts", id: :serial, force: :cascade do |t|
    t.string "receiver_type"
    t.integer "receiver_id"
    t.integer "notification_id", null: false
    t.boolean "is_read", default: false
    t.boolean "trashed", default: false
    t.boolean "deleted", default: false
    t.string "mailbox_type", limit: 25
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_delivered", default: false
    t.string "delivery_method"
    t.string "message_id"
    t.index ["notification_id"], name: "index_mailboxer_receipts_on_notification_id"
    t.index ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "recipient_id"
    t.integer "actor_id"
    t.datetime "read_at"
    t.string "action"
    t.integer "notifiable_id"
    t.string "notifiable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "recipient_type"
    t.string "actor_type"
  end

  create_table "paiements", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "user_id"
    t.integer "lesson_id"
    t.datetime "created_at"
    t.float "amount_eleve"
    t.float "amount_prof"
  end

  create_table "presences", force: :cascade do |t|
    t.integer "lesson_id"
    t.integer "user_id"
    t.boolean "perf"
    t.string "stripe_charge"
    t.datetime "deleted_at"
  end

  create_table "roles", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "power", default: 0
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_roles_on_deleted_at"
  end

  create_table "stripe_customers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "cour_id"
    t.string "stripe_customer_id"
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
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_teachers_on_deleted_at"
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
    t.string "first_name"
    t.string "last_name"
    t.integer "niveau"
    t.string "phone"
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
end
