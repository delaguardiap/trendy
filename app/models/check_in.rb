class CheckIn < ActiveRecord::Base
  belongs_to :user
  belongs_to :venue

  scope :active, -> {
  	where(active: true)
  }

  # scope :active, -> {
  # 	where("created_at < ? AND created_at > ? AND active = ?", Time.now, (Time.now - 5.hours), false)
  # }

  # scope :active, -> {
  # 	where(created_at: (Time.now - 5.hours)..Time.now)
  # }

	scope :inactive, -> {
		where("created_at < ? OR active = ?", (Time.now - 5.hours), false)
	}


	def deactivate!
		self.update(active: false)
	end


	
	# def is_inactive
	# 	if self.active == false
	# 		self.destroy
	# 	end
	# end
end
