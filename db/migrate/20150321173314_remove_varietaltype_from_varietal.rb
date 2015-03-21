class RemoveVarietaltypeFromVarietal < ActiveRecord::Migration
  def change
    remove_column :varietals, :varietal_type, :string
  end
end
