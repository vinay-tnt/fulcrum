# This migration comes from core (originally 20240919083916)
class AddPrimaryColumnToDeviceProvisionable < ActiveRecord::Migration[7.1]
  def change
    add_column :rp_device_provisionables, :primary, :boolean, null: false, default: false
  end
end
