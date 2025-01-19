# This migration comes from core (originally 20241120060906)
class CreateCoreSiteInventoryCounts < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_site_inventory_counts, id: :uuid do |t|
      t.references :tenant, foreign_key: {to_table: :rp_tenants}, type: :uuid, null: false
      t.references :site, foreign_key: {to_table: :rp_sites}, type: :uuid, null: false

      t.integer :frequency, default: 0
      t.bigint  :start_timestamp
      t.bigint  :end_timestamp
      t.integer :existing
      t.integer :total
      t.integer :inbound_total
      t.integer :inbound_cellular
      t.integer :inbound_ble
      t.integer :inbound_manual
      t.integer :inbound_auto
      t.integer :outbound_total
      t.integer :outbound_cellular
      t.integer :outbound_ble
      t.integer :outbound_manual
      t.integer :outbound_auto
      t.integer :total_devices_reported
      t.integer :unused_devices
      t.integer :deprovisioned
      t.integer :newly_provisioned
      t.jsonb :data, default: {}

      t.timestamps
    end

    # Giving a custom name, as auto generated name is giving name long error
    add_index :rp_site_inventory_counts, %i[site_id frequency start_timestamp end_timestamp], name: 'index_rp_site_inventory_counts_site_index', unique: true
    add_index :rp_site_inventory_counts, %i[site_id frequency], unique: false
  end
end
