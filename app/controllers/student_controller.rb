class StudentController < ApplicationController
  def student_show
    @student = Student.find(params[:id])
    render 'student/student_show'
  end

  def student_new
    @student = Student.new
    render 'student/student_new'
  end

  def student_create
    @student = Student.new(student_params)
    if @student.save
      redirect_to root_path
    else
      render 'student/student_new'
    end
  end

  private

    def student_params
      params.require(:student).permit(:studentid, :firstname, :lastname, :email, :password, :program)
    end
end
