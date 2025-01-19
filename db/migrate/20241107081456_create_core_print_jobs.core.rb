# This migration comes from core (originally 20241107075613)
class CreateCorePrintJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_print_jobs, id: :uuid do |t|
      t.references :device, foreign_key: {to_table: :rp_devices}, type: :uuid, null: false

      t.references :workflow, polymorphic: true, type: :uuid, null: false
      t.references :printable, polymorphic: true, type: :uuid, null: false

      t.integer :priority, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.references :smart_label_template, foreign_key: {to_table: :rp_smart_label_templates}, type: :uuid, null: false
      t.string :respone_message
      t.bigint :queued_at_ms, null: false
      t.bigint :updated_at_ms, null: false
      t.jsonb :metadata, null: false, default: {}
      t.jsonb :field_maping, null:false, default: []

      t.references :tenant, foreign_key: {to_table: :rp_tenants}, type: :uuid, null: false
      t.datetime :discarded_at
      t.timestamps
    end

    add_index :rp_print_jobs, %i[id device_id status]
    add_index :rp_print_jobs, %i[id device_id updated_at_ms]
    add_index :rp_print_jobs, %i[id device_id updated_at_ms status], name: "idx_print_job_id_device_updated_at_status"
  end
end
