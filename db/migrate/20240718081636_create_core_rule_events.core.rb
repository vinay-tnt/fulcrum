# This migration comes from core (originally 20240716130734)
class CreateCoreRuleEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :rp_rule_events, id: :uuid do |t|
      t.jsonb :data, default: {}

      t.string :unique_reading_id
      t.bigint :timestamp

      t.references :rule, foreign_key: { to_table: :rp_rules }, type: :uuid, null: false
      t.references :tenant, foreign_key: {to_table: :rp_tenants}, type: :uuid, null: false

      t.integer :severity, null: false, default: 0

      # Polymorphism related value
      t.references :rule_eventable, polymorphic: true, type: :uuid

      t.timestamp :discarded_at
      t.timestamps
    end

    add_index :rp_rule_events, %i[rule_id tenant_id]
    add_index :rp_rule_events, %i[rule_eventable_id rule_id tenant_id]
    add_index :rp_rule_events, %i[rule_id rule_eventable_id]
    add_index :rp_rule_events, %i[rule_eventable_id tenant_id]
  end
end
