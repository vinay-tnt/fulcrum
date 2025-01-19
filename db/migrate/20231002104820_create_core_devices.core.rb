# This migration comes from core (originally 20230929182343)
class CreateCoreDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_devices, id: :uuid do |t|
      t.string :device_identifier, null: false
      t.integer :status, default: 1
      t.jsonb :metadata, default: {}
      t.jsonb :thing, default: {}
      t.bigint :dead_at

      t.references :device_model, foreign_key: {to_table: :rp_device_models}, type: :uuid, null: false
      t.references :tenant, foreign_key: {to_table: :rp_tenants}, type: :uuid, null: false

      t.datetime :discarded_at
      t.timestamps
    end

    add_index :rp_devices, %i[device_identifier], unique: true
    add_index :rp_devices, %i[device_identifier tenant_id], unique: true
    add_index :rp_devices, %i[device_identifier tenant_id device_model_id], name: "index_on_devices_with_tenant_id"
  end
end
