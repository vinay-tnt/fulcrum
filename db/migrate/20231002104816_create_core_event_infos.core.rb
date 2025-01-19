# This migration comes from core (originally 20230929182118)
class CreateCoreEventInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_event_infos, id: :uuid do |t|
      t.string :event_type, null: false
      t.jsonb :metadata, default: {}

      t.references :tenant, foreign_key: {to_table: :rp_tenants}, type: :uuid, null: false

      t.datetime :discarded_at

      t.timestamps
    end
  end
end
