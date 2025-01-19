# This migration comes from core (originally 20230929185034)
class CreateCoreShipments < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_shipments, id: :uuid do |t|
      t.string :shipment_identifier, null: false
      t.integer :status, default: 0, null: false

      t.bigint :transit_start_time
      t.bigint :transit_end_time

      t.references :tenant, foreign_key: {to_table: :rp_tenants}, type: :uuid, null: false
      t.references :template, foreign_key: {to_table: :rp_templates}, type: :uuid, null: false

      t.references :source_site, foreign_key: {to_table: :rp_sites}, type: :uuid
      t.references :destination_site, foreign_key: {to_table: :rp_sites}, type: :uuid

      t.jsonb :source_address, null: false, default: {}
      t.jsonb :destination_address, null: false, default: {}

      t.jsonb :metadata, default: {}

      t.datetime :discarded_at
      t.timestamps
    end

    add_index :rp_shipments, %i[shipment_identifier]
    add_index :rp_shipments, %i[shipment_identifier tenant_id], unique: true
  end
end
