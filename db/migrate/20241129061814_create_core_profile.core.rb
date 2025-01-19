# This migration comes from core (originally 20241129054335)
class CreateCoreProfile < ActiveRecord::Migration[7.1]
  def change
    create_table :rp_profiles, id: :uuid do |t|
      t.string :name, null: false
      t.string :description
      t.integer :profile_type, null: false
      t.integer :status, default: 0, null: false
      t.jsonb :data, default: {}
      t.references :device_model, foreign_key: {to_table: :rp_device_models}, type: :uuid
      t.references :creator, polymorphic: true, type: :uuid, null: false
      t.references :updator, polymorphic: true, type: :uuid
      t.references :tenant, foreign_key: {to_table: :rp_tenants}, type: :uuid, null: false
      t.jsonb :metadata, default: {}

      t.timestamps
    end
  end
end
