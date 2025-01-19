# frozen_string_literal: true

# This migration comes from core (originally 20240307145214)
class CreateCoreTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_trips, id: :uuid do |t|
      t.string :trip_identifier, null: false
      t.integer :status, default: 0

      t.bigint :transit_start_time
      t.bigint :transit_end_time

      t.jsonb :source_address, null: false, default: {}
      t.jsonb :destination_address, null: false, default: {}
      t.jsonb :metadata, default: {}

      t.references :source_site, foreign_key: { to_table: :rp_sites }, type: :uuid
      t.references :destination_site, foreign_key: { to_table: :rp_sites }, type: :uuid
      t.references :tenant, foreign_key: { to_table: :rp_tenants }, type: :uuid, null: false

      t.datetime :discarded_at
      t.timestamps
    end

    add_index :rp_trips, %i[trip_identifier]
    add_index :rp_trips, %i[trip_identifier tenant_id], unique: true
  end
end
