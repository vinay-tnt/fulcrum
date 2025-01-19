# This migration comes from core (originally 20240515180908)
class CreateCoreAssetGroupAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_asset_group_assignments, id: :uuid do |t|
      t.references :asset_group, foreign_key: {to_table: :rp_asset_groups}, type: :uuid, null: false
      t.references :asset, foreign_key: {to_table: :rp_assets}, type: :uuid, null: false
      t.references :tenant, foreign_key: {to_table: :rp_tenants}, type: :uuid, null: false

      t.jsonb :metadata, default: {}

      t.integer :status, default: 1

      t.datetime :discarded_at
      t.timestamps
    end

    add_index :rp_asset_group_assignments, %i[asset_group_id asset_id]
    add_index :rp_asset_group_assignments, %i[asset_group_id asset_id tenant_id], unique: true, name: "idx_rpag_ast_t_id"
  end
end
