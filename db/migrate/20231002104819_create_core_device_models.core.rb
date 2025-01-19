# This migration comes from core (originally 20230929182337)
class CreateCoreDeviceModels < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_device_models, id: :uuid do |t|
      t.string :model_number, null: false
      t.integer :device_type, null: false
      t.string :vendor, null: false
      t.jsonb :metadata, default: {}

      t.jsonb :policy, default: {}
      t.jsonb :thing_type, default: {}
      t.jsonb :certificates, default: []

      # IoT Core Policy Topics
      t.text :publish_topics
      t.text :subscribe_topics
      t.text :receive_topics

      # Flag to check if the device model is supported
      t.boolean :active

      # Just leaving this column for future use if needed
      t.datetime :discarded_at
      t.timestamps
    end

    add_index :rp_device_models, :model_number, unique: true
  end
end
