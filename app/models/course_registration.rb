class CourseRegistration < ActiveRecord::Base
		validates_uniqueness_of :courseid, scope: :studentid
end
