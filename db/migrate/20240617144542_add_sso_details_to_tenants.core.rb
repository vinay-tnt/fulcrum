# This migration comes from core (originally 20240617143527)
class AddSsoDetailsToTenants < ActiveRecord::Migration[7.1]
  def change
    add_column :rp_tenants, :oauth_details, :json, default: {}
    add_column :rp_tenants, :login_enabled, :boolean, default: true
  end
end
