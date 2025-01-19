# This migration comes from core (originally 20240301054313)
class CreateCoreFleetType < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_fleet_types, id: :uuid do |t|
      t.string :name, null: false
      t.integer :fleet_type, null: false, default: 0
      t.string :fleet_icon_url
      t.jsonb :metadata, default: {}

      t.references :tenant, foreign_key: {to_table: :rp_tenants}, type: :uuid, null: false

      t.integer :status, default: 1
      t.datetime :discarded_at

      t.timestamps
    end

    add_index :rp_fleet_types, %i[name tenant_id], unique: true
    add_index :rp_fleet_types, %i[name tenant_id fleet_type], unique: true
  end
end
