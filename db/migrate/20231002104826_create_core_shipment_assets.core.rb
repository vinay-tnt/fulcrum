# This migration comes from core (originally 20230930022006)
class CreateCoreShipmentAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_shipment_assets, id: :uuid do |t|
      t.references :shipment, foreign_key: {to_table: :rp_shipments}, type: :uuid, null: false
      t.references :asset, foreign_key: {to_table: :rp_assets}, type: :uuid, null: false
      t.references :tenant, foreign_key: {to_table: :rp_tenants}, type: :uuid, null: false

      t.jsonb :metadata, default: {}

      t.integer :status, default: 1

      t.datetime :discarded_at
      t.timestamps
    end

    add_index :rp_shipment_assets, %i[shipment_id asset_id]
    add_index :rp_shipment_assets, %i[shipment_id asset_id tenant_id], unique: true, name: 'idx_rpsa_ast_t_id'
  end
end
