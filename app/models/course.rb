class Course < ApplicationRecord
	has_many :users, through: :user_courses
	has_many :user_courses

	validate :start_date_should_be_after_today
	validate :end_date_at_least_same_with_start_date

	geocoded_by :venue
	after_validation :geocode

	def self.search(search)
  		where("title ILIKE ? OR description ILIKE ? OR venue ILIKE ?", "%#{search}%","%#{search}%","%#{search}%") 
	end


	def start_date_should_be_after_today
	    if start_date <= Date.today
	      errors.add(:start_date, "Can't be in the past or today.")
	    end
  	end

  	def end_date_at_least_same_with_start_date
	  	if end_date < start_date
	    	errors.add :end_date, "Can't be earlier than start date"
	  	end
  	end

end
