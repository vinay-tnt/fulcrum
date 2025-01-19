# This migration comes from core (originally 20240926084054)
class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_links, id: :uuid do |t|
      t.references :user, foreign_key: {to_table: :rp_users}, type: :uuid, null: false
      t.references :recipient_user, foreign_key: { to_table: :rp_users }, type: :uuid
      t.references :tenant, foreign_key: { to_table: :rp_tenants }, type: :uuid, null: false
      t.uuid :linkable_id, null: false
      t.string :linkable_type, null: false
      t.string :token, null: false
      t.string :email, null: false
      t.timestamp :expires_at, null: false
      t.timestamp :discarded_at
      t.timestamp :last_resend
      t.json :metadata, default: {}
      t.integer :status, null: false, default: 0
      t.integer :link_type, null: false, default: 0
      t.string :description, default: nil
      t.timestamps
    end

    add_index :rp_links, :token, unique: true
    add_index :rp_links, [:linkable_type, :linkable_id]
    add_index :rp_links, :email
    add_index :rp_links, [:token, :tenant_id]
    add_index :rp_links, [:linkable_type, :linkable_id, :tenant_id]
    add_index :rp_links, [:linkable_type, :linkable_id, :tenant_id, :status], name: 'idx_rp_links_on_linkable_tenant_status'
  end
end
