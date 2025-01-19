# frozen_string_literal: true

# This migration comes from core (originally 20240307145305)
class CreateCoreFleetTripAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_fleet_trip_assets, id: :uuid do |t|
      t.references :fleet_trip, foreign_key: { to_table: :rp_fleet_trips }, type: :uuid, null: false
      t.references :asset, foreign_key: { to_table: :rp_assets }, type: :uuid, null: false
      t.references :tenant, foreign_key: { to_table: :rp_tenants }, type: :uuid, null: false

      t.integer :status, default: 0

      t.jsonb :metadata, default: {}

      t.datetime :discarded_at
      t.timestamps
    end

    add_index :rp_fleet_trip_assets, %i[fleet_trip_id asset_id tenant_id], unique: true,
                                                                           name: 'idx_fleet_trip_asset'
  end
end
