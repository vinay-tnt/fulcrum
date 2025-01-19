# This migration comes from core (originally 20240716130452)
class CreateCoreRuleAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :rp_rule_assignments, id: :uuid do |t|
      t.references :rule, foreign_key: { to_table: :rp_rules }, type: :uuid, null: false
      t.integer :status, null: false, default: 1
      # Polymorphism related value
      t.references :ruleable, polymorphic: true, type: :uuid

      t.jsonb :data, default: {}
      t.jsonb :metadata, default: {}
      t.references :tenant, foreign_key: { to_table: :rp_tenants }, type: :uuid, null: false
      t.datetime :discarded_at
      t.bigint :disabled_at
      t.timestamps
    end

    add_index :rp_rule_assignments, %i[rule_id tenant_id]
    add_index :rp_rule_assignments, %i[ruleable_id tenant_id]
  end
end
