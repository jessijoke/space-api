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

ActiveRecord::Schema.define(version: 2021_06_20_025325) do

  create_table "caferes", force: :cascade do |t|
    t.string "name"
    t.integer "total"
    t.integer "reservation_number"
    t.integer "meal1"
    t.integer "meal2"
    t.integer "meal3"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movieres", force: :cascade do |t|
    t.string "name"
    t.integer "total"
    t.integer "reservation_number"
    t.integer "movie1"
    t.integer "movie2"
    t.integer "movie3"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.string "name"
    t.integer "wheelchair"
    t.integer "ald"
    t.integer "total"
    t.integer "reservation_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string "ticket_type"
    t.integer "reservation_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "tickets_of_id"
    t.string "tickets_of_type"
  end

end
