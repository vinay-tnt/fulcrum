# This migration comes from core (originally 20240706194501)
class AddThemeToTenants < ActiveRecord::Migration[7.1]
  def change
    add_column :rp_tenants, :theme, :json, default: {}
  end
end
