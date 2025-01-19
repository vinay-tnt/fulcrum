# This migration comes from core (originally 20240924051123)
class AddPrimaryColumnToCurrentProvisionable < ActiveRecord::Migration[7.1]
  def change
    add_column :rp_current_provisionables, :primary, :boolean, null: false, default: false
  end
end
