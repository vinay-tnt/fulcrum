class CreateReadings < ActiveRecord::Migration[7.0]
  def change
    create_table :readings, id: false do |t|
      # Unique ID for the reading
      t.uuid    :unique_reading_id, null: false

      # Source of the reading and when the reading was received by the IoT Core
      t.text    :source, null: false
      t.bigint  :iot_core_received_at, null: false

      # To store the device information
      t.text  :device_identifier, null: false
      t.text  :firmware_version, null: false
      t.text  :software_version, null: false
      t.text  :gateway_identifier

      # To store the timestamp of the reading in epoch (milliseconds)
      t.bigint  :timestamp, null: false

      # To store battery data
      t.float   :battery_voltage
      t.float   :battery_percentage

      # To store network data
      t.float   :signal_strength

      # To store sensor data
      t.float   :temperature
      t.float   :humidity
      t.float   :pressure
      t.float   :light

      # To store accelerometer data
      t.float   :acceleration_x
      t.float   :acceleration_y
      t.float   :acceleration_z
      t.float   :shock

      # To store location
      t.float   :latitude
      t.float   :longitude
      t.float   :altitude
      t.float   :speed
      t.text    :address
      t.boolean :filtered_location
      t.float   :location_accuracy

      # To store previous accurate location
      t.jsonb   :previous_accurate_location
      t.jsonb   :other_data

      t.timestamptz :created_at
    end

    # Indexes for the readings table
    add_index :readings, :unique_reading_id
    add_index :readings, :timestamp
    add_index :readings, :device_identifier
    add_index :readings, :gateway_identifier
    add_index :readings, %i[device_identifier timestamp], name: 'device_ts_idx'
    add_index :readings, %i[gateway_identifier timestamp], name: 'gateway_ts_idx'
    add_index :readings, %i[device_identifier gateway_identifier], name: 'device_gateway_idx'
    add_index :readings, %i[device_identifier gateway_identifier timestamp], name: 'device_gateway_ts_idx'
    add_index :readings, %i[unique_reading_id device_identifier timestamp], unique: true, name: 'urid_device_ts_idx'
  end
end
