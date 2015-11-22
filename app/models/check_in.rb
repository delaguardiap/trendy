class CheckIn < ActiveRecord::Base
  belongs_to :user
  belongs_to :venue
  scope :active_checkIns, -> {where(created_at: (Time.now - 5.hours) .. Time.now)}
	# scope :inactive_checkIns, ->{where("created_at > ?", Time.now - 2.seconds)}
end
