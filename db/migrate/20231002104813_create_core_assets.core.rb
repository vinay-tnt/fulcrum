# This migration comes from core (originally 20230929182030)
class CreateCoreAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_assets, id: :uuid do |t|
      t.string :name, null: false
      t.jsonb :metadata, default: {}
      t.integer :status, default: 1

      t.references :parent, foreign_key: {to_table: :rp_assets}, type: :uuid
      t.references :tenant, foreign_key: {to_table: :rp_tenants}, type: :uuid, null: false
      t.references :asset_type, foreign_key: {to_table: :rp_asset_types}, type: :uuid, null: false

      t.datetime :discarded_at

      t.timestamps
    end

    add_index :rp_assets, %i[name tenant_id], unique: true
    add_index :rp_assets, %i[name tenant_id parent_id], unique: true
    add_index :rp_assets, %i[name tenant_id parent_id asset_type_id], unique: true, name: "idx_asset_parent_asset_type"
  end
end
