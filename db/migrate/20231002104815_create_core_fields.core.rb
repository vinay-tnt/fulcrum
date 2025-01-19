# This migration comes from core (originally 20230929182106)
class CreateCoreFields < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_fields, id: :uuid do |t|
      t.string :name, null: false
      t.string :label, null: false
      t.string :placeholder
      t.string :description
      t.string :default
      t.integer :usage_status, null: false, default: 0
      t.integer :html_type, null: false, default: 0
      t.jsonb :options, default: []

      t.references :tenant, foreign_key: {to_table: :rp_tenants}, type: :uuid, null: false

      # Polymorphism related value
      t.references :fieldable, polymorphic: true, type: :uuid

      t.integer :status, default: 1

      t.datetime :discarded_at
      t.timestamps
    end

    add_index :rp_fields, %i[name tenant_id]
    add_index :rp_fields, %i[usage_status tenant_id]
    add_index :rp_fields, %i[html_type tenant_id]
    add_index :rp_fields, %i[name tenant_id fieldable_id], unique: true
  end
end
