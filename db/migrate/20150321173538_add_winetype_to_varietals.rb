class AddWinetypeToVarietals < ActiveRecord::Migration
  def change
    add_reference :varietals, :wine_type, index: true
    add_foreign_key :varietals, :wine_types
  end
end
