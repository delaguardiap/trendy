class CheckIn < ActiveRecord::Base
  belongs_to :user
  belongs_to :venue
end