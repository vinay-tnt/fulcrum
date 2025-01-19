# This migration comes from core (originally 20240716124201)
class CreateCoreRules < ActiveRecord::Migration[7.1]
  def change
    create_table :rp_rules, id: :uuid do |t|
      t.string :name, null: false
      t.string :short_name, null: false
      t.string :description
      t.integer :status, null: false, default: 1
      t.integer :severity, null: false, default: 0
      t.integer :scope, null: false, default: 0
      t.datetime :valid_from
      t.datetime :valid_to
      t.integer :trigger_type, null: false, default: 0
      t.jsonb :conditions, null: false, default: {}
      t.boolean :continuous, default: false
      t.integer :visibility, null: false, default: 0
      t.jsonb :metadata, default: {}

      t.references :tenant, null: false, foreign_key: {to_table: :rp_tenants}, type: :uuid, null: false

      # Polymorphism related value
      t.references :creator, polymorphic: true, type: :uuid, null: false

      t.bigint :disabled_at
      t.datetime :discarded_at

      t.timestamps
    end

    add_index :rp_rules, %i[short_name tenant_id], unique: true
    add_index :rp_rules, %i[status tenant_id]
  end
end
