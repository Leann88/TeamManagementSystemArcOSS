class Team < ActiveRecord::Base
	validates :name, :listOfMembers, :numOfStudents, presence: true #check to see if these attributes have values
	validates_uniqueness_of :listOfMembers, scope: :teamcollaborationid
	validates_uniqueness_of :name, scope: :teamcollaborationid #check to see is the name has alreay been take in the context of team collaborations it is for

	def validate_listOfMembers
		members = listOfMembers.gsub(/\s+/, "").split(/,/)
		for i in 0..members.length - 1
			if !Student.find_by(studentid: members[i]) #check to see if student exists
				return false
			end
			#Check to see if student is registered in course
			if !CourseRegistration.find_by(studentid: Student.find_by(studentid: members[i]).id, courseid: Course.find_by(TeamCollaboration.find(teamcollaborationid).courseid))
				return false
			end
			if !check_student_not_already_in_team(members[i]) #go to function below
				return false
			end
		end
		return true
	end

	def check_student_not_already_in_team(studentid)
		teams = Team.where(teamcollaborationid: teamcollaborationid) #find all teams for a specific team collaboration
		teams.each do |t| #for each team found
			members = t.listOfMembers.gsub(/\s+/, "").split(/,/) #make an array of their members
			members.each do |m|
				if m == studentid #check to see if a member'd student id is the same as the student to be added to the team
					return false
				end
			end
		end
		return true
	end
	
end
