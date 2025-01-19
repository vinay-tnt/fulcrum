# This migration comes from core (originally 20241104060107)
class ChangeLinksUserNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :rp_links, :user_id, true
  end
end
