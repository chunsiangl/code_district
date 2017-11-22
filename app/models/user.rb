class User < ApplicationRecord
	has_secure_password
	has_many :courses, through: :user_courses
	has_many :user_courses

	validates :first_name, presence: true
    validates :last_name, presence: true 
	validates :password, presence: true, length: { :in => 7..20 }, on: :create
	validates :email, uniqueness: {case_sensitive: false, message: "Error: An account with this email already exists."}
	validates :email, presence: true, format: { with: (/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i),message: "Error: Invalid email format." }

	enum role: [ :student, :mentor, :admin ]
end
