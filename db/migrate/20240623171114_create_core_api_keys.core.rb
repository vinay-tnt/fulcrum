# This migration comes from core (originally 20240623132337)
class CreateCoreApiKeys < ActiveRecord::Migration[7.1]
  def change
    create_table :rp_api_keys, id: :uuid do |t|
      t.string :api_key, null: false
      t.string :description
      t.bigint :expires_at, null: false
      t.string :defined_permissions, array: true
      t.references :tenant, null: false, foreign_key: {to_table: :rp_tenants}, type: :uuid

      t.datetime :discarded_at
      t.timestamps
    end

    # Add indexes
    add_index :rp_api_keys, :api_key, unique: true
    add_index :rp_api_keys, %i[api_key expires_at]
  end
end
