class CreateAppellations < ActiveRecord::Migration
  def change
    create_table :appellations do |t|
      t.string :app_name
      t.string :app_region
      t.string :app_area

      t.timestamps null: false
    end
  end
end
