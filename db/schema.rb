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

ActiveRecord::Schema.define(version: 20170430143958) do

  create_table "equipment_orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "worker_id"
    t.integer "person_equipment_id"
    t.integer "order_id"
    t.integer "count"
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.datetime "created_at"
    t.text     "file",       limit: 65535
    t.string   "status",                   default: "ordered"
  end

  create_table "person_equipments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "title"
    t.string   "size"
    t.string   "manafacturer"
    t.string   "manafacturer_country"
    t.string   "code"
    t.integer  "count"
    t.integer  "worker_id"
    t.integer  "issuer_id"
    t.string   "warranty"
    t.string   "category"
    t.string   "article_number"
    t.datetime "issuer_date"
    t.boolean  "special_order",                                default: false
    t.decimal  "price",                precision: 6, scale: 2, default: "0.0"
    t.datetime "purchased_at"
  end

  create_table "tasks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.boolean  "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "role",                   default: "user"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "account_id"
    t.string   "phone_number"
    t.boolean  "active"
    t.string   "position"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "workers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "position"
    t.integer  "breast_size"
    t.integer  "waist_size"
    t.integer  "hip_size"
    t.integer  "height"
    t.integer  "foot_size"
    t.boolean  "active",      default: true
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "unit"
  end

end
