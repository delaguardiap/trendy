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

	def downvote!(user)
		c = upvotes.find_by user_id: user.id
		c.destroy
	end

	def upvoted? user
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
end
