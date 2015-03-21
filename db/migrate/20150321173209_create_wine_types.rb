class CreateWineTypes < ActiveRecord::Migration
  def change
    create_table :wine_types do |t|
      t.integer :api_id
      t.string :type

      t.timestamps null: false
    end
  end
end
