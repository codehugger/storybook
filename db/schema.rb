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

ActiveRecord::Schema.define(version: 2018_10_31_193632) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_agents", force: :cascade do |t|
    t.bigint "story_action_id"
    t.bigint "action_parameter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_parameter_id"], name: "index_action_agents_on_action_parameter_id"
    t.index ["story_action_id"], name: "index_action_agents_on_story_action_id"
  end

  create_table "action_effects", force: :cascade do |t|
    t.bigint "story_action_id"
    t.bigint "predicate_definition_id"
    t.boolean "negative"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["predicate_definition_id"], name: "index_action_effects_on_predicate_definition_id"
    t.index ["story_action_id"], name: "index_action_effects_on_story_action_id"
  end

  create_table "action_inputs", force: :cascade do |t|
    t.string "action_inputable_type"
    t.bigint "action_inputable_id"
    t.bigint "predicate_input_id"
    t.bigint "action_parameter_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_parameter_id"], name: "index_action_inputs_on_action_parameter_id"
    t.index ["predicate_input_id"], name: "index_action_inputs_on_predicate_input_id"
  end

  create_table "action_parameters", force: :cascade do |t|
    t.bigint "story_action_id"
    t.string "name"
    t.bigint "parameter_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parameter_type_id"], name: "index_action_parameters_on_parameter_type_id"
    t.index ["story_action_id"], name: "index_action_parameters_on_story_action_id"
  end

  create_table "action_preconditions", force: :cascade do |t|
    t.bigint "story_action_id"
    t.bigint "predicate_definition_id"
    t.boolean "negative"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["predicate_definition_id"], name: "index_action_preconditions_on_predicate_definition_id"
    t.index ["story_action_id"], name: "index_action_preconditions_on_story_action_id"
  end

  create_table "parameter_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "predicate_definitions", force: :cascade do |t|
    t.bigint "story_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["story_id"], name: "index_predicate_definitions_on_story_id"
  end

  create_table "predicate_inputs", force: :cascade do |t|
    t.bigint "predicate_definition_id"
    t.string "name"
    t.bigint "parameter_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parameter_type_id"], name: "index_predicate_inputs_on_parameter_type_id"
    t.index ["predicate_definition_id"], name: "index_predicate_inputs_on_predicate_definition_id"
  end

  create_table "stories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "story_actions", force: :cascade do |t|
    t.bigint "story_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["story_id"], name: "index_story_actions_on_story_id"
  end

  add_foreign_key "action_agents", "action_parameters"
  add_foreign_key "action_agents", "story_actions"
  add_foreign_key "action_effects", "predicate_definitions"
  add_foreign_key "action_effects", "story_actions"
  add_foreign_key "action_inputs", "action_parameters"
  add_foreign_key "action_inputs", "predicate_inputs"
  add_foreign_key "action_parameters", "parameter_types"
  add_foreign_key "action_parameters", "story_actions"
  add_foreign_key "action_preconditions", "predicate_definitions"
  add_foreign_key "action_preconditions", "story_actions"
  add_foreign_key "predicate_definitions", "stories"
  add_foreign_key "predicate_inputs", "parameter_types"
  add_foreign_key "predicate_inputs", "predicate_definitions"
  add_foreign_key "story_actions", "stories"
end
