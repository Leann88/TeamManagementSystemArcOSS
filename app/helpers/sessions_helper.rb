module SessionsHelper

  def log_in(student)
    session[:user_id] = student.studentid
  end

  def instructorlog_in(instructor)
    session[:user_id] = instructor.employeeid
  end

   def current_user
    @current_user ||= (Student.find_by(studentid: session[:user_id]) || Instructor.find_by(employeeid: session[:user_id])) || nil
   end

   def logged_in?
    !current_user.nil?
  end


  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
