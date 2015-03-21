class CreateVarietals < ActiveRecord::Migration
  def change
    create_table :varietals do |t|
      t.integer :api_id
      t.string :varietal
      t.string :varietal_type

      t.timestamps null: false
    end
  end
end
