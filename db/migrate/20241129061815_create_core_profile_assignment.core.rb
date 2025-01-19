# This migration comes from core (originally 20241129054336)
class CreateCoreProfileAssignment < ActiveRecord::Migration[7.1]
  def change
    create_table :rp_profile_assignments, id: :uuid do |t|
      t.references :profile, foreign_key: {to_table: :rp_profiles}, type: :uuid, null: false
      t.references :assignable, polymorphic: true, type: :uuid, null: false
      t.references :creator, polymorphic: true, type: :uuid, null: false
      t.references :tenant, foreign_key: {to_table: :rp_tenants}, type: :uuid, null: false
      t.jsonb :metadata, default: {}

      t.timestamps
    end
  end
end
