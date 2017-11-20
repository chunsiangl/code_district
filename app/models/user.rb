class User < ApplicationRecord
	  has_secure_password
	  has_many :courses, through: :user_courses
	  has_many :user_courses

	  enum role: [ :student, :mentor, :admin ]
end
