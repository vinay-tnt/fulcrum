# This migration comes from core (originally 20230929180932)
class CreateCoreTenants < ActiveRecord::Migration[7.0]
  def change
    create_table :rp_tenants, id: :uuid do |t|
      t.string :name, null: false
      t.string :subdomain, null: false
      t.string :website
      t.string :email, null: false
      t.string :description
      t.jsonb :billing_group, default: {}
      t.integer :status, default: 0
      t.jsonb :data, default: {}
      t.references :parent, foreign_key: {to_table: :rp_tenants}, type: :uuid

      t.jsonb :address, default: {}

      t.datetime :discarded_at
      t.timestamps
    end

    add_index :rp_tenants, :name
    add_index :rp_tenants, :subdomain, unique: true
    add_index :rp_tenants, %i[name subdomain], unique: true
  end
end
