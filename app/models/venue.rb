class Venue < ActiveRecord::Base
	has_many :check_ins
	belongs_to :check_in

end
