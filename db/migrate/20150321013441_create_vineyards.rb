class CreateVineyards < ActiveRecord::Migration
  def change
    create_table :vineyards do |t|
      t.string :vineyard_name

      t.timestamps null: false
    end
  end
end
