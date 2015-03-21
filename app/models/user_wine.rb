class UserWine < ActiveRecord::Base
  belongs_to :user
  belongs_to :wine
  belongs_to :stage
end
