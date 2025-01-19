# This migration comes from core (originally 20230929182015)
class CreateCoreSites < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_sites, id: :uuid do |t|
      t.string :name, null: false
      t.integer :status, default: 1

      t.jsonb :metadata, default: {}
      t.jsonb :address, default: {}

      t.references :parent, foreign_key: {to_table: :rp_sites}, type: :uuid
      t.references :site_type, foreign_key: {to_table: :rp_site_types}, type: :uuid, null: false
      t.references :tenant, foreign_key: {to_table: :rp_tenants}, type: :uuid, null: false

      t.datetime :discarded_at

      t.timestamps
    end

    add_index :rp_sites, %i[name tenant_id]
    add_index :rp_sites, %i[name tenant_id site_type_id parent_id], unique: true, name: "idx_site_site_type_parent_site"
  end
end
