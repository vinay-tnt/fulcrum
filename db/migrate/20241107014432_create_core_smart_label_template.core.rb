# This migration comes from core (originally 20241106035055)
class CreateCoreSmartLabelTemplate < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_smart_label_templates, id: :uuid do |t|
      t.integer :label_format, null: false
      t.string :name, null: false
      t.string :description
      t.string :file, null: false
      t.jsonb :dimensions, null: false, default: {}
      t.jsonb :metadata, null: false, default: {}
      t.integer :scope, null: false
      t.jsonb :field_map, null:false, default: []
      t.references :user, foreign_key: {to_table: :rp_users}, type: :uuid, null: false
      t.references :tenant, foreign_key: {to_table: :rp_tenants}, type: :uuid, null: false
      t.integer :status, default: 1
      t.datetime :discarded_at

      t.timestamps
    end

    add_index :rp_smart_label_templates, %i[name tenant_id], unique: true
    add_index :rp_smart_label_templates, %i[name scope tenant_id], unique: true
    add_index :rp_smart_label_templates, %i[name scope status tenant_id], name: "idx_smart_label_template_scope_status"
  end
end
