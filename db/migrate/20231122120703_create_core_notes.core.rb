# This migration comes from core (originally 20231122111020)
class CreateCoreNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_notes, id: :uuid do |t|
      t.text :content

      t.references :tenant, foreign_key: {to_table: :rp_tenants}, type: :uuid, null: false

      # Polymorphism related value
      t.references :notable, polymorphic: true, type: :uuid

      t.references :author, foreign_key: {to_table: :rp_users}, type: :uuid

      t.datetime :discarded_at
      t.timestamps
    end
  end
end
