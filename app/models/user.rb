class User < ActiveRecord::Base
	validates :email, uniqueness: {case_senstive: false}
	has_secure_password
end
