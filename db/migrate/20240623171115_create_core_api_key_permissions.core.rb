# This migration comes from core (originally 20240623140117)
class CreateCoreApiKeyPermissions < ActiveRecord::Migration[7.1]
  def change
    create_table :rp_api_key_permissions, id: :uuid do |t|
      t.references :api_key, null: false, foreign_key: { to_table: :rp_api_keys } , type: :uuid
      t.references :permission, null: false, foreign_key: { to_table: :rp_permissions }, type: :uuid
      t.references :tenant, null: false, foreign_key: { to_table: :rp_tenants }, type: :uuid

      t.datetime :discarded_at
      t.timestamps
    end
  end
end
