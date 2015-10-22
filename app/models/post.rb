class Post < ActiveRecord::Base

	# Validations
	validates :story, presence: true

	# Relationships
	belongs_to :user
end
