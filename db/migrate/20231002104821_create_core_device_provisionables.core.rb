# This migration comes from core (originally 20230929182402)
class CreateCoreDeviceProvisionables < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_device_provisionables, id: :uuid do |t|
      t.integer :status, null: false, default: 0
      t.bigint :provisioned_at, null: false
      t.bigint :deprovisioned_at

      t.references :device, foreign_key: {to_table: :rp_devices}, type: :uuid, null: false
      t.references :tenant, foreign_key: {to_table: :rp_tenants}, type: :uuid, null: false

      # Polymorphism related value
      t.references :provisionable, polymorphic: true, type: :uuid, null: false
      t.integer :provisionable_scope, null: false

      t.jsonb :metadata, default: {}

      t.datetime :discarded_at
      t.timestamps
    end

    add_index :rp_device_provisionables, %i[tenant_id device_id]
    add_index :rp_device_provisionables, %i[tenant_id device_id provisionable_type],
      name: "idx_tenant_device_type"
    add_index :rp_device_provisionables, %i[tenant_id device_id provisionable_type provisionable_id],
      name: "idx_tenant_device_type_and_id",
      unique: true
  end
end
