# This migration comes from core (originally 20230929182422)
class CreateCoreCurrentProvisionables < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_current_provisionables, id: :uuid do |t|
      t.integer :status
      t.bigint :provisioned_at
      t.bigint :deprovisioned_at

      t.references :device, foreign_key: {to_table: :rp_devices}, type: :uuid, null: false
      t.references :tenant, foreign_key: {to_table: :rp_tenants}, type: :uuid, null: false

      # Polymorphism related value
      t.references :provisionable, polymorphic: true, type: :uuid, null: true
      t.integer :provisionable_scope, null: true

      t.jsonb :metadata, default: {}

      # Additional Fields
      t.string :device_identifier, null: false, unique: true
      t.string :device_type, null: true
      t.string :provisioned_value, null: true

      # Additional Fields for Asset/Site
      t.string :provisioned_type, null: true
      t.string :provisioned_icon_url, null: true

      t.datetime :discarded_at
      t.timestamps
    end

    add_index :rp_current_provisionables, %i[tenant_id device_id]
    add_index :rp_current_provisionables, %i[tenant_id device_id provisionable_type],
      name: "idx_rp_tenant_provisionable_type"
    add_index :rp_current_provisionables, :device_identifier, unique: true
  end
end
