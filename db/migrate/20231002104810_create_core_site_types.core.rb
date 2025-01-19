# This migration comes from core (originally 20230929181036)
class CreateCoreSiteTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_site_types, id: :uuid do |t|
      t.string :name, null: false
      t.integer :site_type, null: false, default: 0
      t.string :site_icon_url
      t.jsonb :metadata, default: {}

      t.references :parent, foreign_key: {to_table: :rp_site_types}, type: :uuid
      t.references :tenant, null: false, foreign_key: {to_table: :rp_tenants}, type: :uuid

      t.integer :status, default: 1
      t.datetime :discarded_at
      t.timestamps
    end

    add_index :rp_site_types, %i[name tenant_id], unique: true
    add_index :rp_site_types, %i[name tenant_id site_type], unique: true
  end
end
