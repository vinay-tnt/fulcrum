# This migration comes from core (originally 20240725123332)
class CreateCoreFeatureFlag < ActiveRecord::Migration[7.1]
  def change
    create_table :rp_feature_flags, id: :uuid do |t|
      t.jsonb :data, default: {}

      t.references :feature, foreign_key: {to_table: :rp_features}, type: :uuid, null: false
      t.references :tenant, foreign_key: {to_table: :rp_tenants}, type: :uuid, null: false

      t.boolean :enabled, null: false, default: false
      
      t.timestamps
    end

    add_index :rp_feature_flags, [:feature_id, :tenant_id], unique: true
  end
end
