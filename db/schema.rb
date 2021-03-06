# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_13_210558) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "caminos", force: :cascade do |t|
    t.string "camino"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "origen_id"
    t.integer "destino_id"
    t.index ["destino_id"], name: "index_caminos_on_destino_id"
    t.index ["origen_id"], name: "index_caminos_on_origen_id"
  end

  create_table "carritos", force: :cascade do |t|
    t.integer "pasaje_id"
    t.integer "insumo_id"
    t.integer "cantidad", default: 1
    t.index ["insumo_id"], name: "index_carritos_on_insumo_id"
    t.index ["pasaje_id"], name: "index_carritos_on_pasaje_id"
  end

  create_table "chofers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "apellido"
    t.string "dni"
    t.string "telefono"
    t.string "nombre"
    t.index ["email"], name: "index_chofers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_chofers_on_reset_password_token", unique: true
  end

  create_table "combis", force: :cascade do |t|
    t.string "patente"
    t.string "modelo"
    t.integer "capacidad"
    t.boolean "super_comoda"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "insumos", force: :cascade do |t|
    t.string "nombre"
    t.float "precio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "descripcion"
  end

  create_table "lugars", force: :cascade do |t|
    t.string "ciudad"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provincia"
  end

  create_table "pasajes", force: :cascade do |t|
    t.integer "viaje_id"
    t.integer "user_id"
    t.boolean "estado", default: true
    t.string "comentario"
    t.integer "puntaje"
    t.boolean "covid"
    t.index ["user_id"], name: "index_pasajes_on_user_id"
    t.index ["viaje_id"], name: "index_pasajes_on_viaje_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nombre"
    t.string "apellido"
    t.string "dni"
    t.string "tarjeta"
    t.date "FechaExpiracion"
    t.date "covid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "viajes", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "camino_id"
    t.datetime "FechayHora"
    t.integer "chofer_id"
    t.integer "combi_id"
    t.float "precio"
    t.integer "estado", default: 0
    t.index ["camino_id"], name: "index_viajes_on_camino_id"
    t.index ["chofer_id"], name: "index_viajes_on_chofer_id"
    t.index ["combi_id"], name: "index_viajes_on_combi_id"
  end

end
