class AddApiidToVineyard < ActiveRecord::Migration
  def change
    add_column :vineyards, :api_id, :integer
  end
end
