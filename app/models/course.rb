class Course < ApplicationRecord
	has_many :users, through: :user_courses
	has_many :user_courses
end
