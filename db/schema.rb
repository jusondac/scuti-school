# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_08_17_093741) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "class_room_students", force: :cascade do |t|
    t.bigint "class_room_id", null: false
    t.bigint "user_id", null: false
    t.integer "approval_status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "requested_at"
    t.datetime "approved_at"
    t.index ["class_room_id", "user_id"], name: "index_class_room_students_on_class_room_id_and_user_id", unique: true
    t.index ["class_room_id"], name: "index_class_room_students_on_class_room_id"
    t.index ["user_id"], name: "index_class_room_students_on_user_id"
  end

  create_table "class_rooms", force: :cascade do |t|
    t.string "name", null: false
    t.string "subject", null: false
    t.integer "visibility", default: 0, null: false
    t.integer "quota", default: 30, null: false
    t.integer "status", default: 0, null: false
    t.text "description"
    t.bigint "teacher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status"], name: "index_class_rooms_on_status"
    t.index ["teacher_id"], name: "index_class_rooms_on_teacher_id"
    t.index ["visibility"], name: "index_class_rooms_on_visibility"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.integer "access_level"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "class_room_students", "class_rooms"
  add_foreign_key "class_room_students", "users"
  add_foreign_key "class_rooms", "users", column: "teacher_id"
end
