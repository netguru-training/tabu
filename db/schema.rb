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

ActiveRecord::Schema.define(version: 20140308150313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
