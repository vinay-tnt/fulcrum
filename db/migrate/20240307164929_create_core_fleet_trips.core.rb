# frozen_string_literal: true

# This migration comes from core (originally 20240307145243)
class CreateCoreFleetTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_fleet_trips, id: :uuid do |t|
      t.references :fleet, foreign_key: { to_table: :rp_fleets }, type: :uuid, null: false
      t.references :trip, foreign_key: { to_table: :rp_trips }, type: :uuid, null: false
      t.references :tenant, foreign_key: { to_table: :rp_tenants }, type: :uuid, null: false

      t.integer :status, default: 0

      t.jsonb :metadata, default: {}

      t.datetime :discarded_at
      t.timestamps
    end

    add_index :rp_fleet_trips, %i[fleet_id trip_id tenant_id], unique: true, name: 'idx_fleet_trip'
  end
end
