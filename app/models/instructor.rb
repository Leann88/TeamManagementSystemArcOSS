class Instructor < ActiveRecord::Base
	has_many :courses
	validates_uniqueness_of :employeeid
	validates :employeeid, :password, :firstname, :lastname, :email, presence: true
	validates :employeeid, format: { with: /e[0-9]+/,
    message: "Employee ID must be in format e######" }

	def find_courses 
		@courses = Course.where(:instructorid => id)
	end
end
