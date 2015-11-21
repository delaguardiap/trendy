class Venue < ActiveRecord::Base
	has_many :check_ins
end
