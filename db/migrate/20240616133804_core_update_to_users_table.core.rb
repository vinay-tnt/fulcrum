# This migration comes from core (originally 20240616133804)
class CoreUpdateToUsersTable < ActiveRecord::Migration[7.1]
  def change
  # For Confirmable
    add_column :rp_users, :unconfirmed_email, :string # Only if using reconfirmable

    # For Rememberable
    add_column :rp_users, :remember_created_at, :datetime

    # For Trackable
    add_column :rp_users, :sign_in_count, :integer, default: 0, null: false
    add_column :rp_users, :current_sign_in_at, :datetime
    add_column :rp_users, :last_sign_in_at, :datetime
    add_column :rp_users, :current_sign_in_ip, :string
    add_column :rp_users, :last_sign_in_ip, :string
  end
end
