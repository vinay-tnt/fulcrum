# frozen_string_literal: true

# This migration comes from core (originally 20240307145254)
class CreateCoreFleetTripShipments < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_fleet_trip_shipments, id: :uuid do |t|
      t.references :fleet_trip, foreign_key: { to_table: :rp_fleet_trips }, type: :uuid, null: false
      t.references :shipment, foreign_key: { to_table: :rp_shipments }, type: :uuid, null: false
      t.references :tenant, foreign_key: { to_table: :rp_tenants }, type: :uuid, null: false

      t.jsonb :metadata, default: {}

      t.datetime :discarded_at
      t.timestamps
    end

    add_index :rp_fleet_trip_shipments, %i[fleet_trip_id shipment_id tenant_id], unique: true,
                                                                                 name: 'idx_fleet_trip_shipment'
  end
end
