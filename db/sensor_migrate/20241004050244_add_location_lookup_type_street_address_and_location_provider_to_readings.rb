class AddLocationLookupTypeStreetAddressAndLocationProviderToReadings < ActiveRecord::Migration[7.0]
  def change
    add_column :readings, :location_lookup_type, :integer
    add_column :readings, :street_address, :string
    add_column :readings, :location_provider, :integer
  end
end
