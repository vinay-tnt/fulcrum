# This migration comes from core (originally 20240716083906)
class AddSiteIdAndTimesUsedToCurrentProvisionable < ActiveRecord::Migration[7.1]
  def change
    add_reference :rp_current_provisionables, :inventory_site, foreign_key: { to_table: :rp_sites }, type: :uuid, null: true
    add_column :rp_current_provisionables, :times_used, :integer, default: 0, null: false
  end
end
