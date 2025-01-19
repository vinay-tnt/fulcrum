class AddInferredAddressToReadings < ActiveRecord::Migration[7.0]
  def change
    add_column :readings, :inferred_latitude, :float
    add_column :readings, :inferred_longitude, :float
    add_column :readings, :inferred_address, :text
  end
end
