# This migration comes from core (originally 20241212085810)
class AddSettingsToTenants < ActiveRecord::Migration[7.0]
  def change
     add_column :rp_tenants, :settings, :json, default: {}
  end
end
