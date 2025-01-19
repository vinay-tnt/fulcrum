# This migration comes from core (originally 20230929183349)
class CreateCoreAlerts < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_alerts, id: :uuid do |t|
      t.string :name, null: false
      t.integer :status, null: false, default: 1
      t.string :description
      t.integer :trigger_type, null: false
      t.integer :severity, null: false, default: 0
      t.boolean :continuous, default: false
      t.jsonb :conditions, null: false, default: {}

      t.jsonb :metadata, default: {}

      t.references :event_info, null: true, foreign_key: {to_table: :rp_event_infos}, type: :uuid
      t.references :tenant, null: false, foreign_key: {to_table: :rp_tenants}, type: :uuid

      # Polymorphism related value
      t.references :alertable, polymorphic: true, type: :uuid
      t.integer :alertable_scope, null: false

      t.bigint :disabled_at
      t.datetime :discarded_at

      t.references :created_by, foreign_key: {to_table: :rp_users}, type: :uuid

      t.timestamps
    end

    add_index :rp_alerts, %i[status alertable_id tenant_id]
  end
end
