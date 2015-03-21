class AddWinetypeToWineTypes < ActiveRecord::Migration
  def change
    add_column :wine_types, :wine_type, :string
  end
end
