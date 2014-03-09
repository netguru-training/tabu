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

ActiveRecord::Schema.define(version: 20140309155124) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
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

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "cards", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forbidden_words", force: true do |t|
    t.integer  "card_id"
    t.integer  "word_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "forbidden_words", ["card_id"], name: "index_forbidden_words_on_card_id", using: :btree
  add_index "forbidden_words", ["word_id"], name: "index_forbidden_words_on_word_id", using: :btree

  create_table "game_cards", force: true do |t|
    t.integer  "card_id"
    t.integer  "game_id"
    t.integer  "team_id"
    t.integer  "result"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "game_cards", ["card_id"], name: "index_game_cards_on_card_id", using: :btree
  add_index "game_cards", ["game_id"], name: "index_game_cards_on_game_id", using: :btree
  add_index "game_cards", ["team_id"], name: "index_game_cards_on_team_id", using: :btree

  create_table "games", force: true do |t|
    t.string   "name"
    t.integer  "team1_id"
    t.integer  "team2_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "game_id"
  end

  add_index "teams", ["game_id"], name: "index_teams_on_game_id", using: :btree

  create_table "words", force: true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
