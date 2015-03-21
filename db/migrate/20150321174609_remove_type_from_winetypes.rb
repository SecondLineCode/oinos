class RemoveTypeFromWinetypes < ActiveRecord::Migration
  def change
    remove_column :wine_types, :type, :string
  end
end
