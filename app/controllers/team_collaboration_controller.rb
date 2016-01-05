class TeamCollaborationController < ApplicationController
  def add_team_collaboration
    @course =  Course.find(params[:id])
    @teamCollaboration = TeamCollaboration.new
    render 'team_collaboration/add_team_collaboration'
  end

  def create_team_collaboration
    @teamCollaboration = TeamCollaboration.new(teamCollaboration_params)
     if @teamCollaboration.save
      redirect_to instructors_path(:id => current_user.id)
    else
      flash[:notice] = 'Invalid Team Collaboration Parameters'
      redirect_to newTeamCollaboration_path(:id => @teamCollaboration.courseid)
    end
  end

private

    def teamCollaboration_params
      params.require(:teamCollaboration).permit(:name, :description, :dueDate, :teamFormationDeadline,
        :maximumNumStudents, :minimumNumStudents, :courseid )
    end
end
