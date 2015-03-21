class Varietal < ActiveRecord::Base
  belongs_to :wine_type
  has_many :wines
end
