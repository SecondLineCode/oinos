class CreateUserWines < ActiveRecord::Migration
  def change
    create_table :user_wines do |t|
      t.references :user, index: true
      t.references :wine, index: true
      t.references :stage, index: true
      t.integer :rating
      t.text :review

      t.timestamps null: false
    end
    add_foreign_key :user_wines, :users
    add_foreign_key :user_wines, :wines
    add_foreign_key :user_wines, :stages
  end
end
