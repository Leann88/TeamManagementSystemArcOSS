class SessionsController < ApplicationController
  def student_login
    flash[:notice] = nil
  end

  def student_create
	student = Student.find_by(studentid: params[:session][:studentid].downcase, password:params[:session][:password])
    if student
      log_in student
      redirect_to students_path(:id => student.id)

    else
      flash[:notice] = 'Invalid StudentID and Password Combination'
      render 'student_login'
    end
  end

  def destroy
  	log_out
    redirect_to root_url
  end

  def instructor_login
    flash[:notice] = nil
  end

  def create_instructor
    instructor = Instructor.find_by(employeeid: params[:session][:employeeid].downcase, password:params[:session][:password])
    if instructor
      instructorlog_in instructor
      redirect_to instructors_path(:id => instructor.id)

    else
      flash[:notice] = 'Invalid EmployeeID and Password Combination'
      render 'instructor_login'
    end
  end
end
