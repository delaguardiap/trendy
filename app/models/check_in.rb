class CheckIn < ActiveRecord::Base
  belongs_to :user
  belongs_to :venue
  has_many :upvotes
  has_many :downvotes

  scope :active, -> {
  	where(active: true, created_at: (Time.now - 5.hours)..(Time.now))
  }

	scope :inactive, -> {
		where("created_at < ? OR active = ?", (Time.now - 5.hours), false)
	}


	def deactivate!
		self.update(active: false)
	end

 	def upvote!(user)
  	upvotes.create user_id: user.id
	end

	def upvoted? user
		# puts user.id
		if upvotes.empty? == false
				upvotes.each do |upvote|

					if upvote.user_id == user.id
						return true
					end
				end
			return false
		end
		return false
	end


	# def downvote!
	# 	downvotes.create
	# end

	# def votes
	# 	upvotes.count - downvotes.count	
	# end	


	
	# def is_inactive
	# 	if self.active == false
	# 		self.destroy
	# 	end
	# end
end
