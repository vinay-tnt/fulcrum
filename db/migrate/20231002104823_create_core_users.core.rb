# This migration comes from core (originally 20230929183346)
class CreateCoreUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_users, id: :uuid do |t|
      ## Database authenticatable
      t.string :email, null: false, default: ""
      t.string :password_digest, null: false, default: ""

      ## Recoverable
      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      ## Confirmable
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at

      ## Lockable
      t.integer :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at

      ## Invitable
      t.string :invitation_token
      t.datetime :invitation_created_at
      t.datetime :invitation_sent_at
      t.datetime :invitation_accepted_at
      t.integer :invitation_limit
      t.references :invited_by, polymorphic: true, type: :uuid
      t.integer :invitations_count, default: 0

      ## User attributes
      t.string :first_name
      t.string :last_name
      t.string :avatar_url, null: true
      t.jsonb :metadata, default: {}
      t.integer :status, default: 1

      t.references :tenant, foreign_key: {to_table: :rp_tenants}, type: :uuid, null: false

      ## SSO attributes
      t.string :provider
      t.string :uid

      t.datetime :discarded_at

      t.timestamps null: false
    end

    add_index :rp_users, [:email]
    add_index :rp_users, %i[email tenant_id], unique: true
    add_index :rp_users, :reset_password_token, unique: true
    add_index :rp_users, :confirmation_token, unique: true
    add_index :rp_users, :unlock_token, unique: true
    add_index :rp_users, :invitation_token, unique: true
    add_index :rp_users, :invited_by_id
  end
end
