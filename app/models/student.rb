class Student < ActiveRecord::Base
	validates :studentid, :password, :firstname, :lastname, :email, presence: true
	validates_uniqueness_of :studentid
	validates :studentid, format: { with: /s[0-9]+/,
    message: "Student ID must be in format s######" }

  def find_registered_courses
    CourseRegistration.where(studentid: id)
  end

  def in_team(tcid)
  	teams = Team.where(teamcollaborationid: tcid)
  	teams.each do |t|
  		members = t.listOfMembers.gsub(/\s+/, "").split(/,/)
  		members.each do |m|
  			if m == studentid
  				return t.id
  			end
  		end
  	end
  	return nil
  end
  
end
