class Wine < ActiveRecord::Base
  belongs_to :vineyard
  belongs_to :appellation
  belongs_to :varietal

  has_many :user_wines
end
