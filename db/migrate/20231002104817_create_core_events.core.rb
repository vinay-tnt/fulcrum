# This migration comes from core (originally 20230929182130)
class CreateCoreEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_events, id: :uuid do |t|
      t.jsonb :data, default: {}

      t.string :unique_reading_id
      t.bigint :timestamp

      t.references :event_info, foreign_key: {to_table: :rp_event_infos}, type: :uuid, null: false
      t.references :tenant, foreign_key: {to_table: :rp_tenants}, type: :uuid, null: false

      t.integer :severity, null: false, default: 0

      # Polymorphism related value
      t.references :eventable, polymorphic: true, type: :uuid

      t.timestamp :discarded_at
      t.timestamps
    end

    add_index :rp_events, %i[tenant_id eventable_id event_info_id]
    add_index :rp_events, %i[eventable_id event_info_id]
    add_index :rp_events, %i[tenant_id eventable_id]
  end
end
