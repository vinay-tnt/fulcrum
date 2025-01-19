# This migration comes from core (originally 20240716083237)
class CreateCoreDeviceReturnInfo < ActiveRecord::Migration[7.1]
  def change
    create_table :rp_device_return_infos, id: :uuid do |t|
      t.bigint :timestamp, null: false
      t.references :site, foreign_key: {to_table: :rp_sites}, type: :uuid, null: false
      t.float :current_return_rate, null: false, default: 0.0
      t.date :day, null: false

      t.references :tenant, foreign_key: { to_table: :rp_tenants }, type: :uuid, null: false

      t.timestamps
    end

    add_index :rp_device_return_infos, %i[site_id timestamp], unique: true
    add_index :rp_device_return_infos, %i[site_id day], unique: true, name: 'idx_site_day'
  end
end
