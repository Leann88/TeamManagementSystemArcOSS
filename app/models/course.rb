class Course < ActiveRecord::Base
	belongs_to :instructor
	validates :coursecode, :name, :description, presence: true

	def find_collaborations
		TeamCollaboration.where(courseid: id)
	end
end
