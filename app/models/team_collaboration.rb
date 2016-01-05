class TeamCollaboration < ActiveRecord::Base
    validates :name, :description, :dueDate, :teamFormationDeadline, :maximumNumStudents, :minimumNumStudents, presence: true
end
