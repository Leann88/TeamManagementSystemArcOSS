class InstructorController < ApplicationController
  def instructor_show
    @instructor = Instructor.find(params[:id])
    render'instructor/instructor_show'
  end

  def instructor_new
    @instructor = Instructor.new
    render 'instructor/instructor_new'
  end

  def instructor_create
    @instructor = Instructor.new(instructor_params)
    if @instructor.save
      redirect_to root_path
    else
      render 'instructor/instructor_new'
    end
  end

  private

    def instructor_params
      params.require(:instructor).permit(:employeeid, :firstname, :lastname, :email, :password, :program)
    end
end
