# This migration comes from core (originally 20240725123327)
class CreateCoreFeature < ActiveRecord::Migration[7.1]
  def change
    create_table :rp_features, id: :uuid do |t|
      t.jsonb :data, default: {}
      t.string :name, null: false
      t.string :description, null: true
      
      t.timestamps
    end

    add_index :rp_features, [:name], unique: true
  end
end
