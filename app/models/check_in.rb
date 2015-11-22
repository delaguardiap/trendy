class CheckIn < ActiveRecord::Base
  belongs_to :user
  belongs_to :venue
  scope :active_checkIns, -> {where(created_at: (Time.now - 5.hours) .. Time.now)}
	scope :inactive_checkIns, -> {where("created_at < ? OR active = ?", Time.now - 5.hours, false).destroy_all}
	def isInactive
		if self.active == false
			self.destroy
		end
	end
end
