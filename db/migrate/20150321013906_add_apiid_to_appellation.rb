class AddApiidToAppellation < ActiveRecord::Migration
  def change
    add_column :appellations, :api_id, :integer
  end
end
