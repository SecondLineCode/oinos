class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.references :vineyard, index: true
      t.references :appellation, index: true
      t.references :varietal, index: true
      t.string :name
      t.string :label_url
      t.string :api_url
      t.float :pricemin
      t.float :pricemax
      t.string :attributes
      t.string :sku
      t.string :api_provider
      t.integer :api_id

      t.timestamps null: false
    end
    add_foreign_key :wines, :vineyards
    add_foreign_key :wines, :appellations
    add_foreign_key :wines, :varietals
  end
end
