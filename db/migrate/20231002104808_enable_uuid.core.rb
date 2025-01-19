# This migration comes from core (originally 20230929121812)
class EnableUuid < ActiveRecord::Migration[7.0]
  def change
    enable_extension "pgcrypto" unless extensions.include? "pgcrypto"
  end
end
