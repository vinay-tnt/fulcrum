# This migration comes from core (originally 20240921132637)
class AddScopeToRpEventInfos < ActiveRecord::Migration[7.1]
  def change
    add_column :rp_event_infos, :event_scope, :integer
    add_index :rp_event_infos, :event_scope

    add_index :rp_event_infos, %i[tenant_id id event_scope]
  end
end
