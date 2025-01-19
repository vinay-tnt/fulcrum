# This migration comes from core (originally 20230929182239)
class CreateCoreSubscriptions < ActiveRecord::Migration[7.0]
  create_table :rp_subscriptions, id: :uuid do |t|
    t.jsonb :data, default: {}

    t.references :tenant, foreign_key: {to_table: :rp_tenants}, type: :uuid, null: false

    # Polymorphism related value
    t.references :noticeable, polymorphic: true, type: :uuid

    t.timestamp :discarded_at
    t.timestamps
  end

  add_index :rp_subscriptions, %i[noticeable_id]
end
