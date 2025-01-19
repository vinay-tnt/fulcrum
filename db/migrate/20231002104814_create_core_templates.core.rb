# This migration comes from core (originally 20230929182046)
class CreateCoreTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_templates, id: :uuid do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :template_scope, null: false
      t.jsonb :data, default: {}
      t.boolean :status, default: 1

      t.references :tenant, foreign_key: {to_table: :rp_tenants}, type: :uuid, null: false

      t.datetime :discarded_at

      t.timestamps
    end

    add_index :rp_templates, %i[name tenant_id]
    add_index :rp_templates, %i[name template_scope tenant_id], unique: true
  end
end
