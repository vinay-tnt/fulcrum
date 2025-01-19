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

ActiveRecord::Schema[7.1].define(version: 2024_10_04_050244) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "timescaledb"

  create_table "readings", id: false, force: :cascade do |t|
    t.uuid "unique_reading_id", null: false
    t.text "source", null: false
    t.bigint "iot_core_received_at", null: false
    t.text "device_identifier", null: false
    t.text "firmware_version", null: false
    t.text "software_version", null: false
    t.text "gateway_identifier"
    t.bigint "timestamp", null: false
    t.float "battery_voltage"
    t.float "battery_percentage"
    t.float "signal_strength"
    t.float "temperature"
    t.float "humidity"
    t.float "pressure"
    t.float "light"
    t.float "acceleration_x"
    t.float "acceleration_y"
    t.float "acceleration_z"
    t.float "shock"
    t.float "latitude"
    t.float "longitude"
    t.float "altitude"
    t.float "speed"
    t.text "address"
    t.boolean "filtered_location"
    t.float "location_accuracy"
    t.jsonb "previous_accurate_location"
    t.jsonb "other_data"
    t.timestamptz "created_at"
    t.float "inferred_latitude"
    t.float "inferred_longitude"
    t.text "inferred_address"
    t.integer "location_lookup_type"
    t.string "street_address"
    t.integer "location_provider"
    t.index ["device_identifier", "gateway_identifier", "timestamp"], name: "device_gateway_ts_idx"
    t.index ["device_identifier", "gateway_identifier"], name: "device_gateway_idx"
    t.index ["device_identifier", "timestamp"], name: "device_ts_idx"
    t.index ["device_identifier"], name: "index_readings_on_device_identifier"
    t.index ["gateway_identifier", "timestamp"], name: "gateway_ts_idx"
    t.index ["gateway_identifier"], name: "index_readings_on_gateway_identifier"
    t.index ["timestamp"], name: "index_readings_on_timestamp"
    t.index ["unique_reading_id", "device_identifier", "timestamp"], name: "urid_device_ts_idx", unique: true
    t.index ["unique_reading_id"], name: "index_readings_on_unique_reading_id"
  end

end
