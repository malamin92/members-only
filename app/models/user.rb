class User < ActiveRecord::Base
	before_save {self.email = email.downcase}

	validates :name, presence: true

	validates :email, uniqueness: {case_sensitive: false}, presence: true,
		length: {maximum: 25}

	validates :password, length: {minimum: 6}, presence: true

	validates :password_confirmation, presence: true

	has_secure_password
end
