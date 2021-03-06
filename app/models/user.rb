class User < ActiveRecord::Base
  has_secure_password
  attr_accessor :remember_token
  attr_accessor :skip_method
  attr_accessor :skip_method1

  has_many :check_ins
  has_many :upvotes
  has_many :active_relationships, class_name: "Relationship",
            foreign_key: "follower_id",
            dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "followed_id",
                                   dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower


  validates :name, presence: true, length: { maximum: 50 }
	validates :email, email: true, uniqueness: true
	validates :password, presence: true, length: { minimum: 6 }, :if => 'provider.blank?'


  def deactivate_check_ins!
    if check_ins.last
      check_ins.last.deactivate!
    end
  end

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE follower_id = :user_id"
    CheckIn.where("user_id IN (#{following_ids}) OR user_id = :user_id", 
                  following_ids: following_ids, user_id: id)
  end

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

  def self.sign_in_from_omniauth(auth)
    find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
  end

  def self.create_user_from_omniauth(auth)
    create(
    provider: auth['provider'],
    uid: auth['uid'],
    name: auth['info']['name']
    )
  end

end
