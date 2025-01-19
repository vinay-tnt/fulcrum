class EnableTimescale < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extensions.include? 'pgcrypto'
    enable_extension 'timescaledb' unless extensions.include? 'timescaledb'
  end
end
