# This migration comes from core (originally 20240510164443)
class CreateCoreAssetGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_asset_groups, id: :uuid do |t|
      t.string :group_name, null: false
      t.integer :status, null: false, default: 1
      t.string :description, null: false
      t.jsonb :metadata, null: false, default: {}

      t.references :tenant, null: false, foreign_key: {to_table: :rp_tenants}, type: :uuid
      t.references :template, foreign_key: {to_table: :rp_templates}, type: :uuid, null: true


      t.datetime :discarded_at
      t.timestamps
    end

    add_index :rp_asset_groups, %i[group_name tenant_id], unique: true
    add_index :rp_asset_groups, %i[group_name template_id tenant_id], unique: true, name: 'idx_name_template_tenant'
  end
end
