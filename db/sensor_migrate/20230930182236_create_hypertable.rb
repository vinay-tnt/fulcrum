class CreateHypertable < ActiveRecord::Migration[7.0]
  def change
    # Chunk interval is set to 12 hours
    execute "SELECT create_hypertable('readings', 'timestamp', chunk_time_interval => 43200000);"
  end
end
