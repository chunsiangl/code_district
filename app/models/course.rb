class Course < ApplicationRecord
	has_many :users, through: :user_courses
	has_many :user_courses

	geocoded_by :venue
	after_validation :geocode

	def self.search(search)
  		where("title ILIKE ? OR description ILIKE ? OR venue ILIKE ?", "%#{search}%","%#{search}%","%#{search}%") 
	end

end
