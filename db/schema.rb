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

ActiveRecord::Schema[7.1].define(version: 2024_12_19_111941) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "active_storage_attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.uuid "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "rp_alerts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.integer "status", default: 1, null: false
    t.string "description"
    t.integer "trigger_type", null: false
    t.integer "severity", default: 0, null: false
    t.boolean "continuous", default: false
    t.jsonb "conditions", default: {}, null: false
    t.jsonb "metadata", default: {}
    t.uuid "event_info_id"
    t.uuid "tenant_id", null: false
    t.string "alertable_type"
    t.uuid "alertable_id"
    t.integer "alertable_scope", null: false
    t.bigint "disabled_at"
    t.datetime "discarded_at"
    t.uuid "created_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alertable_type", "alertable_id"], name: "index_rp_alerts_on_alertable"
    t.index ["created_by_id"], name: "index_rp_alerts_on_created_by_id"
    t.index ["event_info_id"], name: "index_rp_alerts_on_event_info_id"
    t.index ["status", "alertable_id", "tenant_id"], name: "index_rp_alerts_on_status_and_alertable_id_and_tenant_id"
    t.index ["tenant_id"], name: "index_rp_alerts_on_tenant_id"
  end

  create_table "rp_api_key_permissions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "api_key_id", null: false
    t.uuid "permission_id", null: false
    t.uuid "tenant_id", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_key_id"], name: "index_rp_api_key_permissions_on_api_key_id"
    t.index ["permission_id"], name: "index_rp_api_key_permissions_on_permission_id"
    t.index ["tenant_id"], name: "index_rp_api_key_permissions_on_tenant_id"
  end

  create_table "rp_api_keys", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "api_key", null: false
    t.string "description"
    t.bigint "expires_at", null: false
    t.string "defined_permissions", array: true
    t.uuid "tenant_id", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_key", "expires_at"], name: "index_rp_api_keys_on_api_key_and_expires_at"
    t.index ["api_key"], name: "index_rp_api_keys_on_api_key", unique: true
    t.index ["tenant_id"], name: "index_rp_api_keys_on_tenant_id"
  end

  create_table "rp_asset_group_assignments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "asset_group_id", null: false
    t.uuid "asset_id", null: false
    t.uuid "tenant_id", null: false
    t.jsonb "metadata", default: {}
    t.integer "status", default: 1
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_group_id", "asset_id", "tenant_id"], name: "idx_rpag_ast_t_id", unique: true
    t.index ["asset_group_id", "asset_id"], name: "index_rp_asset_group_assignments_on_asset_group_id_and_asset_id"
    t.index ["asset_group_id"], name: "index_rp_asset_group_assignments_on_asset_group_id"
    t.index ["asset_id"], name: "index_rp_asset_group_assignments_on_asset_id"
    t.index ["tenant_id"], name: "index_rp_asset_group_assignments_on_tenant_id"
  end

  create_table "rp_asset_groups", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "group_name", null: false
    t.integer "status", default: 1, null: false
    t.string "description", null: false
    t.jsonb "metadata", default: {}, null: false
    t.uuid "tenant_id", null: false
    t.uuid "template_id"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_name", "template_id", "tenant_id"], name: "idx_name_template_tenant", unique: true
    t.index ["group_name", "tenant_id"], name: "index_rp_asset_groups_on_group_name_and_tenant_id", unique: true
    t.index ["template_id"], name: "index_rp_asset_groups_on_template_id"
    t.index ["tenant_id"], name: "index_rp_asset_groups_on_tenant_id"
  end

  create_table "rp_asset_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.integer "asset_type", default: 0, null: false
    t.string "asset_icon_url"
    t.jsonb "metadata", default: {}
    t.uuid "parent_id"
    t.uuid "tenant_id", null: false
    t.integer "status", default: 1
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "tenant_id", "asset_type"], name: "index_rp_asset_types_on_name_and_tenant_id_and_asset_type", unique: true
    t.index ["name", "tenant_id"], name: "index_rp_asset_types_on_name_and_tenant_id", unique: true
    t.index ["parent_id"], name: "index_rp_asset_types_on_parent_id"
    t.index ["tenant_id"], name: "index_rp_asset_types_on_tenant_id"
  end

  create_table "rp_assets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.jsonb "metadata", default: {}
    t.integer "status", default: 1
    t.uuid "parent_id"
    t.uuid "tenant_id", null: false
    t.uuid "asset_type_id", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_type_id"], name: "index_rp_assets_on_asset_type_id"
    t.index ["name", "tenant_id", "parent_id", "asset_type_id"], name: "idx_asset_parent_asset_type", unique: true
    t.index ["name", "tenant_id", "parent_id"], name: "index_rp_assets_on_name_and_tenant_id_and_parent_id", unique: true
    t.index ["name", "tenant_id"], name: "index_rp_assets_on_name_and_tenant_id", unique: true
    t.index ["parent_id"], name: "index_rp_assets_on_parent_id"
    t.index ["tenant_id"], name: "index_rp_assets_on_tenant_id"
  end

  create_table "rp_carriers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "scac", null: false
    t.text "description"
    t.jsonb "carrier_managers", default: []
    t.string "regions", default: [], array: true
    t.jsonb "metadata", default: {}
    t.uuid "tenant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "scac", "tenant_id"], name: "index_rp_carriers_on_name_and_scac_and_tenant_id", unique: true
    t.index ["tenant_id"], name: "index_rp_carriers_on_tenant_id"
  end

  create_table "rp_current_provisionables", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "status"
    t.bigint "provisioned_at"
    t.bigint "deprovisioned_at"
    t.uuid "device_id", null: false
    t.uuid "tenant_id", null: false
    t.string "provisionable_type"
    t.uuid "provisionable_id"
    t.integer "provisionable_scope"
    t.jsonb "metadata", default: {}
    t.string "device_identifier", null: false
    t.string "device_type"
    t.string "provisioned_value"
    t.string "provisioned_type"
    t.string "provisioned_icon_url"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "recent_reading", default: {}
    t.uuid "inventory_site_id"
    t.integer "times_used", default: 0, null: false
    t.boolean "primary", default: false, null: false
    t.index ["device_id"], name: "index_rp_current_provisionables_on_device_id"
    t.index ["device_identifier"], name: "index_rp_current_provisionables_on_device_identifier", unique: true
    t.index ["inventory_site_id"], name: "index_rp_current_provisionables_on_inventory_site_id"
    t.index ["provisionable_type", "provisionable_id"], name: "index_rp_current_provisionables_on_provisionable"
    t.index ["tenant_id", "device_id", "provisionable_type"], name: "idx_rp_tenant_provisionable_type"
    t.index ["tenant_id", "device_id"], name: "index_rp_current_provisionables_on_tenant_id_and_device_id"
    t.index ["tenant_id"], name: "index_rp_current_provisionables_on_tenant_id"
  end

  create_table "rp_device_models", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "model_number", null: false
    t.integer "device_type", null: false
    t.string "vendor", null: false
    t.jsonb "metadata", default: {}
    t.jsonb "policy", default: {}
    t.jsonb "thing_type", default: {}
    t.jsonb "certificates", default: []
    t.text "publish_topics"
    t.text "subscribe_topics"
    t.text "receive_topics"
    t.boolean "active"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["model_number"], name: "index_rp_device_models_on_model_number", unique: true
  end

  create_table "rp_device_provisionables", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.bigint "provisioned_at", null: false
    t.bigint "deprovisioned_at"
    t.uuid "device_id", null: false
    t.uuid "tenant_id", null: false
    t.string "provisionable_type", null: false
    t.uuid "provisionable_id", null: false
    t.integer "provisionable_scope", null: false
    t.jsonb "metadata", default: {}
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "primary", default: false, null: false
    t.index ["device_id"], name: "index_rp_device_provisionables_on_device_id"
    t.index ["provisionable_type", "provisionable_id"], name: "index_rp_device_provisionables_on_provisionable"
    t.index ["tenant_id", "device_id", "provisionable_type"], name: "idx_tenant_device_type"
    t.index ["tenant_id", "device_id"], name: "index_rp_device_provisionables_on_tenant_id_and_device_id"
    t.index ["tenant_id"], name: "index_rp_device_provisionables_on_tenant_id"
  end

  create_table "rp_device_return_infos", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "timestamp", null: false
    t.uuid "site_id", null: false
    t.float "current_return_rate", default: 0.0, null: false
    t.date "day", null: false
    t.uuid "tenant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id", "day"], name: "idx_site_day", unique: true
    t.index ["site_id", "timestamp"], name: "index_rp_device_return_infos_on_site_id_and_timestamp", unique: true
    t.index ["site_id"], name: "index_rp_device_return_infos_on_site_id"
    t.index ["tenant_id"], name: "index_rp_device_return_infos_on_tenant_id"
  end

  create_table "rp_devices", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "device_identifier", null: false
    t.integer "status", default: 1
    t.jsonb "metadata", default: {}
    t.jsonb "thing", default: {}
    t.bigint "dead_at"
    t.uuid "device_model_id", null: false
    t.uuid "tenant_id", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_identifier", "tenant_id", "device_model_id"], name: "index_on_devices_with_tenant_id"
    t.index ["device_identifier", "tenant_id"], name: "index_rp_devices_on_device_identifier_and_tenant_id", unique: true
    t.index ["device_identifier"], name: "index_rp_devices_on_device_identifier", unique: true
    t.index ["device_model_id"], name: "index_rp_devices_on_device_model_id"
    t.index ["tenant_id"], name: "index_rp_devices_on_tenant_id"
  end

  create_table "rp_event_infos", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "event_type", null: false
    t.jsonb "metadata", default: {}
    t.uuid "tenant_id", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_scope"
    t.index ["event_scope"], name: "index_rp_event_infos_on_event_scope"
    t.index ["tenant_id", "id", "event_scope"], name: "index_rp_event_infos_on_tenant_id_and_id_and_event_scope"
    t.index ["tenant_id"], name: "index_rp_event_infos_on_tenant_id"
  end

  create_table "rp_events", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.jsonb "data", default: {}
    t.string "unique_reading_id"
    t.bigint "timestamp"
    t.uuid "event_info_id", null: false
    t.uuid "tenant_id", null: false
    t.integer "severity", default: 0, null: false
    t.string "eventable_type"
    t.uuid "eventable_id"
    t.datetime "discarded_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_info_id"], name: "index_rp_events_on_event_info_id"
    t.index ["eventable_id", "event_info_id"], name: "index_rp_events_on_eventable_id_and_event_info_id"
    t.index ["eventable_type", "eventable_id"], name: "index_rp_events_on_eventable"
    t.index ["tenant_id", "eventable_id", "event_info_id"], name: "index_rp_events_on_tenant_id_and_eventable_id_and_event_info_id"
    t.index ["tenant_id", "eventable_id"], name: "index_rp_events_on_tenant_id_and_eventable_id"
    t.index ["tenant_id"], name: "index_rp_events_on_tenant_id"
  end

  create_table "rp_feature_flags", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.jsonb "data", default: {}
    t.uuid "feature_id", null: false
    t.uuid "tenant_id", null: false
    t.boolean "enabled", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id", "tenant_id"], name: "index_rp_feature_flags_on_feature_id_and_tenant_id", unique: true
    t.index ["feature_id"], name: "index_rp_feature_flags_on_feature_id"
    t.index ["tenant_id"], name: "index_rp_feature_flags_on_tenant_id"
  end

  create_table "rp_features", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.jsonb "data", default: {}
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_rp_features_on_name", unique: true
  end

  create_table "rp_fields", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "label", null: false
    t.string "placeholder"
    t.string "description"
    t.string "default"
    t.integer "usage_status", default: 0, null: false
    t.integer "html_type", default: 0, null: false
    t.jsonb "options", default: []
    t.uuid "tenant_id", null: false
    t.string "fieldable_type"
    t.uuid "fieldable_id"
    t.integer "status", default: 1
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fieldable_type", "fieldable_id"], name: "index_rp_fields_on_fieldable"
    t.index ["html_type", "tenant_id"], name: "index_rp_fields_on_html_type_and_tenant_id"
    t.index ["name", "tenant_id", "fieldable_id"], name: "index_rp_fields_on_name_and_tenant_id_and_fieldable_id", unique: true
    t.index ["name", "tenant_id"], name: "index_rp_fields_on_name_and_tenant_id"
    t.index ["tenant_id"], name: "index_rp_fields_on_tenant_id"
    t.index ["usage_status", "tenant_id"], name: "index_rp_fields_on_usage_status_and_tenant_id"
  end

  create_table "rp_fleet_trip_assets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "fleet_trip_id", null: false
    t.uuid "asset_id", null: false
    t.uuid "tenant_id", null: false
    t.integer "status", default: 0
    t.jsonb "metadata", default: {}
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_rp_fleet_trip_assets_on_asset_id"
    t.index ["fleet_trip_id", "asset_id", "tenant_id"], name: "idx_fleet_trip_asset", unique: true
    t.index ["fleet_trip_id"], name: "index_rp_fleet_trip_assets_on_fleet_trip_id"
    t.index ["tenant_id"], name: "index_rp_fleet_trip_assets_on_tenant_id"
  end

  create_table "rp_fleet_trip_shipments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "fleet_trip_id", null: false
    t.uuid "shipment_id", null: false
    t.uuid "tenant_id", null: false
    t.jsonb "metadata", default: {}
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fleet_trip_id", "shipment_id", "tenant_id"], name: "idx_fleet_trip_shipment", unique: true
    t.index ["fleet_trip_id"], name: "index_rp_fleet_trip_shipments_on_fleet_trip_id"
    t.index ["shipment_id"], name: "index_rp_fleet_trip_shipments_on_shipment_id"
    t.index ["tenant_id"], name: "index_rp_fleet_trip_shipments_on_tenant_id"
  end

  create_table "rp_fleet_trips", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "fleet_id", null: false
    t.uuid "trip_id", null: false
    t.uuid "tenant_id", null: false
    t.integer "status", default: 0
    t.jsonb "metadata", default: {}
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fleet_id", "trip_id", "tenant_id"], name: "idx_fleet_trip", unique: true
    t.index ["fleet_id"], name: "index_rp_fleet_trips_on_fleet_id"
    t.index ["tenant_id"], name: "index_rp_fleet_trips_on_tenant_id"
    t.index ["trip_id"], name: "index_rp_fleet_trips_on_trip_id"
  end

  create_table "rp_fleet_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.integer "fleet_type", default: 0, null: false
    t.string "fleet_icon_url"
    t.jsonb "metadata", default: {}
    t.uuid "tenant_id", null: false
    t.integer "status", default: 1
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "tenant_id", "fleet_type"], name: "index_rp_fleet_types_on_name_and_tenant_id_and_fleet_type", unique: true
    t.index ["name", "tenant_id"], name: "index_rp_fleet_types_on_name_and_tenant_id", unique: true
    t.index ["tenant_id"], name: "index_rp_fleet_types_on_tenant_id"
  end

  create_table "rp_fleets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.integer "status", default: 1
    t.jsonb "metadata", default: {}
    t.uuid "fleet_type_id", null: false
    t.uuid "tenant_id", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fleet_type_id"], name: "index_rp_fleets_on_fleet_type_id"
    t.index ["name", "tenant_id", "fleet_type_id"], name: "idx_fleet_fleet_type", unique: true
    t.index ["name", "tenant_id"], name: "idx_fleet_name", unique: true
    t.index ["tenant_id"], name: "index_rp_fleets_on_tenant_id"
  end

  create_table "rp_links", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.uuid "recipient_user_id"
    t.uuid "tenant_id", null: false
    t.uuid "linkable_id", null: false
    t.string "linkable_type", null: false
    t.string "token", null: false
    t.string "email", null: false
    t.datetime "expires_at", precision: nil, null: false
    t.datetime "discarded_at", precision: nil
    t.datetime "last_resend", precision: nil
    t.json "metadata", default: {}
    t.integer "status", default: 0, null: false
    t.integer "link_type", default: 0, null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_rp_links_on_email"
    t.index ["linkable_type", "linkable_id", "tenant_id", "status"], name: "idx_rp_links_on_linkable_tenant_status"
    t.index ["linkable_type", "linkable_id", "tenant_id"], name: "index_rp_links_on_linkable_type_and_linkable_id_and_tenant_id"
    t.index ["linkable_type", "linkable_id"], name: "index_rp_links_on_linkable_type_and_linkable_id"
    t.index ["recipient_user_id"], name: "index_rp_links_on_recipient_user_id"
    t.index ["tenant_id"], name: "index_rp_links_on_tenant_id"
    t.index ["token", "tenant_id"], name: "index_rp_links_on_token_and_tenant_id"
    t.index ["token"], name: "index_rp_links_on_token", unique: true
    t.index ["user_id"], name: "index_rp_links_on_user_id"
  end

  create_table "rp_notes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "content"
    t.uuid "tenant_id", null: false
    t.string "notable_type"
    t.uuid "notable_id"
    t.uuid "author_id"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_rp_notes_on_author_id"
    t.index ["notable_type", "notable_id"], name: "index_rp_notes_on_notable"
    t.index ["tenant_id"], name: "index_rp_notes_on_tenant_id"
  end

  create_table "rp_permissions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_rp_permissions_on_name", unique: true
  end

  create_table "rp_print_jobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "device_id", null: false
    t.string "workflow_type", null: false
    t.uuid "workflow_id", null: false
    t.string "printable_type", null: false
    t.uuid "printable_id", null: false
    t.integer "priority", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.uuid "smart_label_template_id", null: false
    t.string "response_message"
    t.bigint "queued_at_ms", null: false
    t.bigint "updated_at_ms", null: false
    t.jsonb "metadata", default: {}, null: false
    t.jsonb "field_mapping", default: [], null: false
    t.uuid "tenant_id", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_rp_print_jobs_on_device_id"
    t.index ["id", "device_id", "status"], name: "index_rp_print_jobs_on_id_and_device_id_and_status"
    t.index ["id", "device_id", "updated_at_ms", "status"], name: "idx_print_job_id_device_updated_at_status"
    t.index ["id", "device_id", "updated_at_ms"], name: "index_rp_print_jobs_on_id_and_device_id_and_updated_at_ms"
    t.index ["printable_type", "printable_id"], name: "index_rp_print_jobs_on_printable"
    t.index ["smart_label_template_id"], name: "index_rp_print_jobs_on_smart_label_template_id"
    t.index ["tenant_id"], name: "index_rp_print_jobs_on_tenant_id"
    t.index ["workflow_type", "workflow_id"], name: "index_rp_print_jobs_on_workflow"
  end

  create_table "rp_profile_assignments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "profile_id", null: false
    t.string "assignable_type", null: false
    t.uuid "assignable_id", null: false
    t.string "creator_type", null: false
    t.uuid "creator_id", null: false
    t.uuid "tenant_id", null: false
    t.jsonb "metadata", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignable_type", "assignable_id"], name: "index_rp_profile_assignments_on_assignable"
    t.index ["creator_type", "creator_id"], name: "index_rp_profile_assignments_on_creator"
    t.index ["profile_id"], name: "index_rp_profile_assignments_on_profile_id"
    t.index ["tenant_id"], name: "index_rp_profile_assignments_on_tenant_id"
  end

  create_table "rp_profiles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.integer "profile_type", null: false
    t.integer "status", default: 0, null: false
    t.jsonb "data", default: {}
    t.uuid "device_model_id"
    t.string "creator_type", null: false
    t.uuid "creator_id", null: false
    t.string "updator_type"
    t.uuid "updator_id"
    t.uuid "tenant_id", null: false
    t.jsonb "metadata", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_type", "creator_id"], name: "index_rp_profiles_on_creator"
    t.index ["device_model_id"], name: "index_rp_profiles_on_device_model_id"
    t.index ["tenant_id"], name: "index_rp_profiles_on_tenant_id"
    t.index ["updator_type", "updator_id"], name: "index_rp_profiles_on_updator"
  end

  create_table "rp_rule_assignments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "rule_id", null: false
    t.integer "status", default: 1, null: false
    t.string "ruleable_type"
    t.uuid "ruleable_id"
    t.jsonb "data", default: {}
    t.jsonb "metadata", default: {}
    t.uuid "tenant_id", null: false
    t.datetime "discarded_at"
    t.bigint "disabled_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rule_id", "tenant_id"], name: "index_rp_rule_assignments_on_rule_id_and_tenant_id"
    t.index ["rule_id"], name: "index_rp_rule_assignments_on_rule_id"
    t.index ["ruleable_id", "tenant_id"], name: "index_rp_rule_assignments_on_ruleable_id_and_tenant_id"
    t.index ["ruleable_type", "ruleable_id"], name: "index_rp_rule_assignments_on_ruleable"
    t.index ["tenant_id"], name: "index_rp_rule_assignments_on_tenant_id"
  end

  create_table "rp_rule_events", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.jsonb "data", default: {}
    t.string "unique_reading_id"
    t.bigint "timestamp"
    t.uuid "rule_id", null: false
    t.uuid "tenant_id", null: false
    t.integer "severity", default: 0, null: false
    t.string "rule_eventable_type"
    t.uuid "rule_eventable_id"
    t.datetime "discarded_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rule_eventable_id", "rule_id", "tenant_id"], name: "idx_on_rule_eventable_id_rule_id_tenant_id_d605dc621b"
    t.index ["rule_eventable_id", "tenant_id"], name: "index_rp_rule_events_on_rule_eventable_id_and_tenant_id"
    t.index ["rule_eventable_type", "rule_eventable_id"], name: "index_rp_rule_events_on_rule_eventable"
    t.index ["rule_id", "rule_eventable_id"], name: "index_rp_rule_events_on_rule_id_and_rule_eventable_id"
    t.index ["rule_id", "tenant_id"], name: "index_rp_rule_events_on_rule_id_and_tenant_id"
    t.index ["rule_id"], name: "index_rp_rule_events_on_rule_id"
    t.index ["tenant_id"], name: "index_rp_rule_events_on_tenant_id"
  end

  create_table "rp_rules", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "short_name", null: false
    t.string "description"
    t.integer "status", default: 1, null: false
    t.integer "severity", default: 0, null: false
    t.integer "scope", default: 0, null: false
    t.datetime "valid_from"
    t.datetime "valid_to"
    t.integer "trigger_type", default: 0, null: false
    t.jsonb "conditions", default: {}, null: false
    t.boolean "continuous", default: false
    t.integer "visibility", default: 0, null: false
    t.jsonb "metadata", default: {}
    t.uuid "tenant_id", null: false
    t.string "creator_type", null: false
    t.uuid "creator_id", null: false
    t.bigint "disabled_at"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_type", "creator_id"], name: "index_rp_rules_on_creator"
    t.index ["short_name", "tenant_id"], name: "index_rp_rules_on_short_name_and_tenant_id", unique: true
    t.index ["status", "tenant_id"], name: "index_rp_rules_on_status_and_tenant_id"
    t.index ["tenant_id"], name: "index_rp_rules_on_tenant_id"
  end

  create_table "rp_shipment_assets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "shipment_id", null: false
    t.uuid "asset_id", null: false
    t.uuid "tenant_id", null: false
    t.jsonb "metadata", default: {}
    t.integer "status", default: 1
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_rp_shipment_assets_on_asset_id"
    t.index ["shipment_id", "asset_id", "tenant_id"], name: "idx_rpsa_ast_t_id", unique: true
    t.index ["shipment_id", "asset_id"], name: "index_rp_shipment_assets_on_shipment_id_and_asset_id"
    t.index ["shipment_id"], name: "index_rp_shipment_assets_on_shipment_id"
    t.index ["tenant_id"], name: "index_rp_shipment_assets_on_tenant_id"
  end

  create_table "rp_shipments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "shipment_identifier", null: false
    t.integer "status", default: 0, null: false
    t.bigint "transit_start_time"
    t.bigint "transit_end_time"
    t.uuid "tenant_id", null: false
    t.uuid "template_id", null: false
    t.uuid "source_site_id"
    t.uuid "destination_site_id"
    t.jsonb "source_address", default: {}, null: false
    t.jsonb "destination_address", default: {}, null: false
    t.jsonb "metadata", default: {}
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_site_id"], name: "index_rp_shipments_on_destination_site_id"
    t.index ["shipment_identifier", "tenant_id"], name: "index_rp_shipments_on_shipment_identifier_and_tenant_id", unique: true
    t.index ["shipment_identifier"], name: "index_rp_shipments_on_shipment_identifier"
    t.index ["source_site_id"], name: "index_rp_shipments_on_source_site_id"
    t.index ["template_id"], name: "index_rp_shipments_on_template_id"
    t.index ["tenant_id"], name: "index_rp_shipments_on_tenant_id"
  end

  create_table "rp_site_inventory_counts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "tenant_id", null: false
    t.uuid "site_id", null: false
    t.integer "frequency", default: 0
    t.bigint "start_timestamp"
    t.bigint "end_timestamp"
    t.integer "existing"
    t.integer "total"
    t.integer "inbound_total"
    t.integer "inbound_cellular"
    t.integer "inbound_ble"
    t.integer "inbound_manual"
    t.integer "inbound_auto"
    t.integer "outbound_total"
    t.integer "outbound_cellular"
    t.integer "outbound_ble"
    t.integer "outbound_manual"
    t.integer "outbound_auto"
    t.integer "total_devices_reported"
    t.integer "unused_devices"
    t.integer "deprovisioned"
    t.integer "newly_provisioned"
    t.jsonb "data", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id", "frequency", "start_timestamp", "end_timestamp"], name: "index_rp_site_inventory_counts_site_index", unique: true
    t.index ["site_id", "frequency"], name: "index_rp_site_inventory_counts_on_site_id_and_frequency"
    t.index ["site_id"], name: "index_rp_site_inventory_counts_on_site_id"
    t.index ["tenant_id"], name: "index_rp_site_inventory_counts_on_tenant_id"
  end

  create_table "rp_site_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.integer "site_type", default: 0, null: false
    t.string "site_icon_url"
    t.jsonb "metadata", default: {}
    t.uuid "parent_id"
    t.uuid "tenant_id", null: false
    t.integer "status", default: 1
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "tenant_id", "site_type"], name: "index_rp_site_types_on_name_and_tenant_id_and_site_type", unique: true
    t.index ["name", "tenant_id"], name: "index_rp_site_types_on_name_and_tenant_id", unique: true
    t.index ["parent_id"], name: "index_rp_site_types_on_parent_id"
    t.index ["tenant_id"], name: "index_rp_site_types_on_tenant_id"
  end

  create_table "rp_sites", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.integer "status", default: 1
    t.jsonb "metadata", default: {}
    t.jsonb "address", default: {}
    t.uuid "parent_id"
    t.uuid "site_type_id", null: false
    t.uuid "tenant_id", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "tenant_id", "site_type_id", "parent_id"], name: "idx_site_site_type_parent_site", unique: true
    t.index ["name", "tenant_id"], name: "index_rp_sites_on_name_and_tenant_id"
    t.index ["parent_id"], name: "index_rp_sites_on_parent_id"
    t.index ["site_type_id"], name: "index_rp_sites_on_site_type_id"
    t.index ["tenant_id"], name: "index_rp_sites_on_tenant_id"
  end

  create_table "rp_smart_label_templates", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "label_format", null: false
    t.string "name", null: false
    t.string "description"
    t.string "file", null: false
    t.jsonb "dimensions", default: {}, null: false
    t.jsonb "metadata", default: {}, null: false
    t.integer "scope", null: false
    t.jsonb "field_map", default: [], null: false
    t.uuid "user_id", null: false
    t.uuid "tenant_id", null: false
    t.integer "status", default: 1
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "scope", "status", "tenant_id"], name: "idx_smart_label_template_scope_status"
    t.index ["name", "scope", "tenant_id"], name: "index_rp_smart_label_templates_on_name_and_scope_and_tenant_id", unique: true
    t.index ["name", "tenant_id"], name: "index_rp_smart_label_templates_on_name_and_tenant_id", unique: true
    t.index ["tenant_id"], name: "index_rp_smart_label_templates_on_tenant_id"
    t.index ["user_id"], name: "index_rp_smart_label_templates_on_user_id"
  end

  create_table "rp_subscriptions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.jsonb "data", default: {}
    t.uuid "tenant_id", null: false
    t.string "noticeable_type"
    t.uuid "noticeable_id"
    t.datetime "discarded_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["noticeable_id"], name: "index_rp_subscriptions_on_noticeable_id"
    t.index ["noticeable_type", "noticeable_id"], name: "index_rp_subscriptions_on_noticeable"
    t.index ["tenant_id"], name: "index_rp_subscriptions_on_tenant_id"
  end

  create_table "rp_templates", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.integer "template_scope", null: false
    t.jsonb "data", default: {}
    t.boolean "status", default: true
    t.uuid "tenant_id", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "template_scope", "tenant_id"], name: "index_rp_templates_on_name_and_template_scope_and_tenant_id", unique: true
    t.index ["name", "tenant_id"], name: "index_rp_templates_on_name_and_tenant_id"
    t.index ["tenant_id"], name: "index_rp_templates_on_tenant_id"
  end

  create_table "rp_tenants", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "subdomain", null: false
    t.string "website"
    t.string "email", null: false
    t.string "description"
    t.jsonb "billing_group", default: {}
    t.integer "status", default: 0
    t.jsonb "data", default: {}
    t.uuid "parent_id"
    t.jsonb "address", default: {}
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "oauth_details", default: {}
    t.boolean "login_enabled", default: true
    t.json "theme", default: {}
    t.json "settings", default: {}
    t.index ["name", "subdomain"], name: "index_rp_tenants_on_name_and_subdomain", unique: true
    t.index ["name"], name: "index_rp_tenants_on_name"
    t.index ["parent_id"], name: "index_rp_tenants_on_parent_id"
    t.index ["subdomain"], name: "index_rp_tenants_on_subdomain", unique: true
  end

  create_table "rp_trips", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "trip_identifier", null: false
    t.integer "status", default: 0
    t.bigint "transit_start_time"
    t.bigint "transit_end_time"
    t.jsonb "source_address", default: {}, null: false
    t.jsonb "destination_address", default: {}, null: false
    t.jsonb "metadata", default: {}
    t.uuid "source_site_id"
    t.uuid "destination_site_id"
    t.uuid "tenant_id", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["destination_site_id"], name: "index_rp_trips_on_destination_site_id"
    t.index ["source_site_id"], name: "index_rp_trips_on_source_site_id"
    t.index ["tenant_id"], name: "index_rp_trips_on_tenant_id"
    t.index ["trip_identifier", "tenant_id"], name: "index_rp_trips_on_trip_identifier_and_tenant_id", unique: true
    t.index ["trip_identifier"], name: "index_rp_trips_on_trip_identifier"
  end

  create_table "rp_users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "password_digest", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.uuid "invited_by_id"
    t.integer "invitations_count", default: 0
    t.string "first_name"
    t.string "last_name"
    t.string "avatar_url"
    t.jsonb "metadata", default: {}
    t.integer "status", default: 1
    t.uuid "tenant_id", null: false
    t.string "provider"
    t.string "uid"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "unconfirmed_email"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["confirmation_token"], name: "index_rp_users_on_confirmation_token", unique: true
    t.index ["email", "tenant_id"], name: "index_rp_users_on_email_and_tenant_id", unique: true
    t.index ["email"], name: "index_rp_users_on_email"
    t.index ["invitation_token"], name: "index_rp_users_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_rp_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_rp_users_on_invited_by"
    t.index ["reset_password_token"], name: "index_rp_users_on_reset_password_token", unique: true
    t.index ["tenant_id"], name: "index_rp_users_on_tenant_id"
    t.index ["unlock_token"], name: "index_rp_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "rp_alerts", "rp_event_infos", column: "event_info_id"
  add_foreign_key "rp_alerts", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_alerts", "rp_users", column: "created_by_id"
  add_foreign_key "rp_api_key_permissions", "rp_api_keys", column: "api_key_id"
  add_foreign_key "rp_api_key_permissions", "rp_permissions", column: "permission_id"
  add_foreign_key "rp_api_key_permissions", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_api_keys", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_asset_group_assignments", "rp_asset_groups", column: "asset_group_id"
  add_foreign_key "rp_asset_group_assignments", "rp_assets", column: "asset_id"
  add_foreign_key "rp_asset_group_assignments", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_asset_groups", "rp_templates", column: "template_id"
  add_foreign_key "rp_asset_groups", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_asset_types", "rp_asset_types", column: "parent_id"
  add_foreign_key "rp_asset_types", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_assets", "rp_asset_types", column: "asset_type_id"
  add_foreign_key "rp_assets", "rp_assets", column: "parent_id"
  add_foreign_key "rp_assets", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_carriers", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_current_provisionables", "rp_devices", column: "device_id"
  add_foreign_key "rp_current_provisionables", "rp_sites", column: "inventory_site_id"
  add_foreign_key "rp_current_provisionables", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_device_provisionables", "rp_devices", column: "device_id"
  add_foreign_key "rp_device_provisionables", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_device_return_infos", "rp_sites", column: "site_id"
  add_foreign_key "rp_device_return_infos", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_devices", "rp_device_models", column: "device_model_id"
  add_foreign_key "rp_devices", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_event_infos", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_events", "rp_event_infos", column: "event_info_id"
  add_foreign_key "rp_events", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_feature_flags", "rp_features", column: "feature_id"
  add_foreign_key "rp_feature_flags", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_fields", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_fleet_trip_assets", "rp_assets", column: "asset_id"
  add_foreign_key "rp_fleet_trip_assets", "rp_fleet_trips", column: "fleet_trip_id"
  add_foreign_key "rp_fleet_trip_assets", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_fleet_trip_shipments", "rp_fleet_trips", column: "fleet_trip_id"
  add_foreign_key "rp_fleet_trip_shipments", "rp_shipments", column: "shipment_id"
  add_foreign_key "rp_fleet_trip_shipments", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_fleet_trips", "rp_fleets", column: "fleet_id"
  add_foreign_key "rp_fleet_trips", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_fleet_trips", "rp_trips", column: "trip_id"
  add_foreign_key "rp_fleet_types", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_fleets", "rp_fleet_types", column: "fleet_type_id"
  add_foreign_key "rp_fleets", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_links", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_links", "rp_users", column: "recipient_user_id"
  add_foreign_key "rp_links", "rp_users", column: "user_id"
  add_foreign_key "rp_notes", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_notes", "rp_users", column: "author_id"
  add_foreign_key "rp_print_jobs", "rp_devices", column: "device_id"
  add_foreign_key "rp_print_jobs", "rp_smart_label_templates", column: "smart_label_template_id"
  add_foreign_key "rp_print_jobs", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_profile_assignments", "rp_profiles", column: "profile_id"
  add_foreign_key "rp_profile_assignments", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_profiles", "rp_device_models", column: "device_model_id"
  add_foreign_key "rp_profiles", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_rule_assignments", "rp_rules", column: "rule_id"
  add_foreign_key "rp_rule_assignments", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_rule_events", "rp_rules", column: "rule_id"
  add_foreign_key "rp_rule_events", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_rules", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_shipment_assets", "rp_assets", column: "asset_id"
  add_foreign_key "rp_shipment_assets", "rp_shipments", column: "shipment_id"
  add_foreign_key "rp_shipment_assets", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_shipments", "rp_sites", column: "destination_site_id"
  add_foreign_key "rp_shipments", "rp_sites", column: "source_site_id"
  add_foreign_key "rp_shipments", "rp_templates", column: "template_id"
  add_foreign_key "rp_shipments", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_site_inventory_counts", "rp_sites", column: "site_id"
  add_foreign_key "rp_site_inventory_counts", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_site_types", "rp_site_types", column: "parent_id"
  add_foreign_key "rp_site_types", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_sites", "rp_site_types", column: "site_type_id"
  add_foreign_key "rp_sites", "rp_sites", column: "parent_id"
  add_foreign_key "rp_sites", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_smart_label_templates", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_smart_label_templates", "rp_users", column: "user_id"
  add_foreign_key "rp_subscriptions", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_templates", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_tenants", "rp_tenants", column: "parent_id"
  add_foreign_key "rp_trips", "rp_sites", column: "destination_site_id"
  add_foreign_key "rp_trips", "rp_sites", column: "source_site_id"
  add_foreign_key "rp_trips", "rp_tenants", column: "tenant_id"
  add_foreign_key "rp_users", "rp_tenants", column: "tenant_id"
end
