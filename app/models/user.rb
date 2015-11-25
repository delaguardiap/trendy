class User < ActiveRecord::Base
  has_secure_password


  has_many :check_ins
	
  validates :name, presence: true, length: { maximum: 50 }
	validates :email, email: true, uniqueness: true
	validates :password, presence: true, length: { minimum: 6 }

  # Will call the active scope on the user's check ins
  # and will call the deactivate! method on each of those check ins.
  def deactivate_check_ins!
    if check_ins.last
      check_ins.last.deactivate!
    end
  end
# user.check_in!(venue)

  def check_in!(venue, review="", rating=0)
    deactivate_check_ins!
    check_ins.create venue: venue, review: review, rating: rating
  end

	def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

	def User.new_token
		SecureRandom.urlsafe_base64
	end

  def remember 
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
  	return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

	def forget
    update_attribute(:remember_digest, nil)
  end
end
