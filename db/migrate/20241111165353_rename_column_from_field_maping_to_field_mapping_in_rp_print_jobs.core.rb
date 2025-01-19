# This migration comes from core (originally 20241111165242)
class RenameColumnFromFieldMapingToFieldMappingInRpPrintJobs < ActiveRecord::Migration[7.0]
  def change
    rename_column :rp_print_jobs, :field_maping, :field_mapping
  end
end
