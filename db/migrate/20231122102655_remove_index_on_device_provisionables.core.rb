# This migration comes from core (originally 20231122102317)
class RemoveIndexOnDeviceProvisionables < ActiveRecord::Migration[7.0]
  def change
    remove_index :rp_device_provisionables, name: :idx_tenant_device_type_and_id
  end
end
