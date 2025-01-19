# This migration comes from core (originally 20230929182022)
class CreateCoreAssetTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_asset_types, id: :uuid do |t|
      t.string :name, null: false
      t.integer :asset_type, null: false, default: 0
      t.string :asset_icon_url
      t.jsonb :metadata, default: {}

      t.references :parent, foreign_key: {to_table: :rp_asset_types}, type: :uuid
      t.references :tenant, foreign_key: {to_table: :rp_tenants}, type: :uuid, null: false

      t.integer :status, default: 1
      t.datetime :discarded_at

      t.timestamps
    end

    add_index :rp_asset_types, %i[name tenant_id], unique: true
    add_index :rp_asset_types, %i[name tenant_id asset_type], unique: true
  end
end
