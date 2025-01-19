# This migration comes from core (originally 20241111104733)
class RenameColumnFromResponeMessageToResponseMessage < ActiveRecord::Migration[7.0]
  def change
    rename_column :rp_print_jobs, :respone_message, :response_message
  end
end
