class CoreAddRecentReadingToCurrentProvisionable < ActiveRecord::Migration[7.0]
  def change
    add_column :rp_current_provisionables, :recent_reading, :jsonb, default: {}
  end
end
