# This migration comes from core (originally 20240623101448)
class CreateCorePermissions < ActiveRecord::Migration[7.1]
  def change
    create_table :rp_permissions, id: :uuid do |t|
      t.string :name
      t.string :description

      t.datetime :discarded_at
      t.timestamps
    end

    add_index :rp_permissions, :name, unique: true
  end
end
