class TeamController < ApplicationController
  
  def team_new
    @teamCollaboration = TeamCollaboration.find(params[:tcid])
    @team = Team.new
    #remember, it renders a page even though not explicitly stated
  end

	def team_create
    #Create a new team with the parameters inputted in the form
    @team = Team.new(team_params)
    #Set the liaison id to the user making the team
    @team.liaisonid = current_user.id
    #make an array using the list of student id's inputted in the form
    @team.numOfStudents = @team.listOfMembers.gsub(/\s+/, "").split(/,/).length
    #check to see if a student in the list is already in a team and id the number of students to be added
    #to the team is less than or equal to the number allowed
    if @team.numOfStudents <= TeamCollaboration.find(@team.teamcollaborationid).maximumNumStudents &&
      @team.validate_listOfMembers #go to team model to see this function
        if @team.save #when you are trying to save the team the validates functions in the model will be run
          redirect_to students_path(:id => current_user.id)
        else
          flash[:notice] = 'Invalid Team Paramaters (name taken)' 
          redirect_to teamCreation_path(:tcid => @team.teamcollaborationid)
        end
    else
      flash[:notice] = 'A student is not valid or too many students in the team'
      redirect_to teamCreation_path(:tcid => @team.teamcollaborationid)
    end
  end

  def teams_list
    count = 0
    @teamCollaboration = TeamCollaboration.find(params[:id]) #find the team collaboration
    @teams = Team.where(teamcollaborationid: params[:id]) #find all the teams in that team collaboration
    @incompleteTeams = Array.new(@teams.length) #make an array that will hold all the incomplete teams, will be equal to or less than the actual number of teams
    for i in 0..@teams.length - 1
      if @teamCollaboration.maximumNumStudents != @teams[i].numOfStudents #if the number of students is not equal to max
        @incompleteTeams[count] = @teams[i] #add the team to the incomplete team array
        count += 1 #increment index
      end
    end
    render 'team/teams_list' #render the page
  end

  def join_team #remember this is a put function
    @team = Team.find_by(id: params[:team][:teamid]) #find the team the student wants to join
    if @team.listOfCandidates == nil #check to see if the list of candidates is null
      @team.listOfCandidates = Student.find_by(id: params[:team][:studentid]).studentid #if it is, add the student to the begin of the list
    else #if the list isn't empty, append the student's id to the list
      @team.listOfCandidates = @team.listOfCandidates + ', ' + Student.find_by(id: params[:team][:studentid]).studentid
    end
    @team.save #save the changes of the team to the database
    redirect_to students_path(:id => current_user.id) #redirect to the student's page, first use team_management_system_controller
  end

  def team_show
    @team = Team.find(params[:id])
    @teamCollaboration = TeamCollaboration.find(@team.teamcollaborationid)
    @members = Array.new(@team.numOfStudents)
    if @team.listOfCandidates != nil
      @candidates = Array.new(@team.listOfCandidates.gsub(/\s+/, "").split(/,/).length)
    else
      @candidates = Array.new
    end
    
    for i in 0..@team.numOfStudents - 1
        @members[i] = Student.find_by(studentid: @team.listOfMembers.gsub(/\s+/, "").split(/,/)[i])
    end
    
    for i in 0..@candidates.length - 1
        @candidates[i] = Student.find_by(studentid: @team.listOfCandidates.gsub(/\s+/, "").split(/,/)[i])
    end
    render 'team/team_show'
  end

  def accept_student
    @team = Team.find_by(id: params[:team][:teamid]) #find the team
    #make sure the student isn't already part of a team and your team isnt full
    if @team.check_student_not_already_in_team(params[:team][:studentid]) && @team.numOfStudents < TeamCollaboration.find(@team.teamcollaborationid).maximumNumStudents
      #append the student to the list of members
       @team.listOfMembers = @team.listOfMembers + ', ' + Student.find_by(studentid: params[:team][:studentid]).studentid
       @team.numOfStudents = @team.numOfStudents + 1 #increment the number of students in the team
       candidates = @team.listOfCandidates.gsub(/\s+/, "").split(/,/) #make an array of the candidate students
       @team.listOfCandidates = nil #want to rebuild the list
       for i in 0..candidates.length - 1 #for every id in the list
        if candidates[i] != params[:team][:studentid] #make sure the candidate's id isn't equal to student accepted to the team
          if @team.listOfCandidates == nil # if the list if nil
          @team.listOfCandidates = candidates[i] #just add the first id to the list
          else #if it isn't empty, append the id to the list
            @team.listOfCandidates = @team.listOfCandidates + ', ' + candidates[i]
          end
        end
       end
       @team.save #save the team
       redirect_to team_path(:id => @team.id) #refresh the team page
    else
      flash[:notice] = 'Student cannot be added to team' #if you could accept the student display this message when the screen refreshes
      redirect_to team_path(:id => @team.id) #refresh the page
    end

  end

  private

    def team_params
      params.require(:team).permit(:name, :liaisonid, :listOfMembers, :listOfCandidates, :creationDate, 
        :numStudents, :teamcollaborationid)
    end
end
