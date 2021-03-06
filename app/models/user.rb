class User < ActiveRecord::Base

	attr_accessor :remember_token
	#before filters
	before_save {self.email = email.downcase}

	#validations
	validates :name, presence: true
	validates :email, uniqueness: {case_sensitive: false}, presence: true,
		length: {maximum: 25}
	validates :password, length: {minimum: 6}, presence: true
	validates :password_confirmation, presence: true
	has_secure_password

	#Relationships
	has_many :posts

	# Functions
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
