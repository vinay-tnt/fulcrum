# This migration comes from core (originally 20240304091548)
class CreateCoreFleet < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_fleets, id: :uuid do |t|
      t.string :name, null: false
      t.integer :status, default: 1

      t.jsonb :metadata, default: {}

      t.references :fleet_type, foreign_key: {to_table: :rp_fleet_types}, type: :uuid, null: false
      t.references :tenant, foreign_key: {to_table: :rp_tenants}, type: :uuid, null: false

      t.datetime :discarded_at

      t.timestamps
    end

    add_index :rp_fleets, %i[name tenant_id], unique: true, name: "idx_fleet_name"
    add_index :rp_fleets, %i[name tenant_id fleet_type_id], unique: true, name: "idx_fleet_fleet_type"
  end
end
