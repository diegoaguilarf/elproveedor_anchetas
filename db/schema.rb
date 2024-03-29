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

ActiveRecord::Schema.define(version: 20161204024843) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ancheta", force: :cascade do |t|
    t.text     "nombre"
    t.integer  "celular",     limit: 8
    t.text     "direccion"
    t.text     "descripcion"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "branding_products", force: :cascade do |t|
    t.string   "marca"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_products", force: :cascade do |t|
    t.string   "categoria"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comidas", force: :cascade do |t|
    t.string   "tipo"
    t.text     "descripcion"
    t.integer  "cantidad"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "productos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.boolean  "visto"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.integer  "codigo",            limit: 8
    t.string   "nombre"
    t.string   "categoria"
    t.string   "marca"
    t.integer  "precio"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                            default: "", null: false
    t.string   "encrypted_password",               default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                    default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "nombre"
    t.string   "tipoidentificacion"
    t.integer  "numeroidentificacion",   limit: 8
    t.string   "nombreestablecimiento"
    t.integer  "telefono",               limit: 8
    t.integer  "celular",                limit: 8
    t.string   "pais"
    t.string   "ciudad"
    t.string   "barrio"
    t.string   "direccion"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "orders", "users"
end
