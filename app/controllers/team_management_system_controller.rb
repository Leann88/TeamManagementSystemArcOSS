class TeamManagementSystemController < ApplicationController

  def home
    render'shared/home'
  end

  def instructor_show
    redirect_to :controller => 'instructor', :action => 'instructor_show', :id => current_user.id
  end

  def instructor_new
    redirect_to :controller => 'instructor', :action => 'instructor_new'
  end


  def student_show
    redirect_to :controller => 'student', :action => 'student_show', :id => current_user.id
  end

  def student_new
    redirect_to :controller => 'student', :action => 'student_new'
  end

  def register_to_a_course
      redirect_to :controller => 'courses', :action => 'register_to_a_course'
  end

  def course_new
    redirect_to :controller => 'courses', :action => 'course_new'
  end


  def add_team_collaboration
    redirect_to :controller => 'team_collaboration', :action => 'add_team_collaboration', :id => params[:id]
  end

  def team_new
    redirect_to :controller => 'team', :action => 'team_new', :tcid => params[:tcid]
  end

  def teams_list
    redirect_to :controller => 'team', :action => 'teams_list', :id => params[:id]
  end

  def team_show
    redirect_to :controller => 'team', :action => 'team_show', :id => params[:id]
  end
end
