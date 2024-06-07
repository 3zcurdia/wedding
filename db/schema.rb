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

ActiveRecord::Schema[7.1].define(version: 2024_06_07_005631) do
  create_table "admin_users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "verified", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
  end

# Could not dump table "events" because of following StandardError
#   Unknown type 'REAL' for column 'value'

# Could not dump table "events_search" because of following StandardError
#   Unknown type '' for column 'topic'

# Could not dump table "events_search_config" because of following StandardError
#   Unknown type '' for column 'k'

  create_table "events_search_data", force: :cascade do |t|
    t.binary "block"
  end

  create_table "events_search_docsize", force: :cascade do |t|
    t.binary "sz"
  end

# Could not dump table "events_search_idx" because of following StandardError
#   Unknown type '' for column 'segid'

  create_table "guests", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone"
    t.integer "plus_ones_count", default: 0
    t.datetime "confirmed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "companion_id"
    t.datetime "last_viewed_at"
    t.integer "confirmed_plus_ones", default: 0
    t.datetime "canceled_at"
    t.index ["companion_id"], name: "index_guests_on_companion_id"
  end

# Could not dump table "guests_search_idx" because of following StandardError
#   Unknown type '' for column 'first_name'

# Could not dump table "guests_search_idx_config" because of following StandardError
#   Unknown type '' for column 'k'

  create_table "guests_search_idx_data", force: :cascade do |t|
    t.binary "block"
  end

  create_table "guests_search_idx_docsize", force: :cascade do |t|
    t.binary "sz"
    t.integer "origin"
  end

# Could not dump table "guests_search_idx_idx" because of following StandardError
#   Unknown type '' for column 'segid'

# Could not dump table "guests_search_idx_instance" because of following StandardError
#   Unknown type '' for column 'term'

# Could not dump table "guests_search_idx_row" because of following StandardError
#   Unknown type '' for column 'term'

  create_table "sessions", force: :cascade do |t|
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.string "user_agent"
    t.string "ip_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id"], name: "index_sessions_on_record"
  end

  create_table "topics", primary_key: "name", id: :text, force: :cascade do |t|
    t.text "state"
    t.integer "updated_at"
  end

  add_foreign_key "events", "topics", column: "topic", primary_key: "name", on_delete: :cascade
  add_foreign_key "guests", "guests", column: "companion_id"
end
