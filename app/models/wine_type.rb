class WineType < ActiveRecord::Base
  has_many :varietals
end
