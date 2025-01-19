# This migration comes from core (originally 20241216135028)
class CreateCoreCarriers < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_carriers, id: :uuid do |t|
      t.string :name, null: false
      t.string :scac, null: false
      t.text :description
      t.jsonb :carrier_managers, default: []
      t.string :regions, array: true, default: []
      t.jsonb :metadata, default: {}

      t.references :tenant, foreign_key: {to_table: :rp_tenants}, type: :uuid, null: false

      t.timestamps
    end

    add_index :rp_carriers, %i[name scac tenant_id], unique: true
  end
end
