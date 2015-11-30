module CheckInsHelper
	
	def lastCheckInValid
		if current_user
		current_user.check_ins.last && current_user.check_ins.last.active == true && current_user.check_ins.last.created_at > 5.hours.ago
		end
	end

	def lastVenue
		 Venue.find(current_user.check_ins.last.venue_id)
	end
end
