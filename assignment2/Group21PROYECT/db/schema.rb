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

ActiveRecord::Schema[7.1].define(version: 2024_05_02_001555) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "asignee_tasks", force: :cascade do |t|
    t.bigint "user_id"
    t.index ["user_id"], name: "index_asignee_tasks_on_user_id"
  end

  create_table "boards", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.text "description", default: "", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_boards_on_user_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.bigint "board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_states_on_board_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.text "description", default: "", null: false
    t.string "priority", default: "", null: false
    t.string "custom_attributes", default: "", null: false
    t.bigint "user_id"
    t.bigint "asignee_task_id"
    t.bigint "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asignee_task_id"], name: "index_tasks_on_asignee_task_id"
    t.index ["state_id"], name: "index_tasks_on_state_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "user_to_boards", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "board_id"
    t.index ["board_id"], name: "index_user_to_boards_on_board_id"
    t.index ["user_id"], name: "index_user_to_boards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "password", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
