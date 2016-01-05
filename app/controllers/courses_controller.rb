class CoursesController < ApplicationController
  
  def register_to_a_course
    @courses = Course.all 
    @courseRegistration = CourseRegistration.new
    render 'course/register_to_a_course'
  end

  def create_course_registration
    @courseRegistration = CourseRegistration.new(courseRegistration_params)
    if @courseRegistration.save
     redirect_to students_path(:id => current_user.id)
    else
      flash[:notice] = 'Already Registered'
      redirect_to courseRegistration_path(:id => current_user.id)
    end
  end

  def course_new
    @course = Course.new
    render 'course/course_new'
  end

  def course_create
    @course = Course.new(course_params)
    @course.instructorid = current_user.id;
    if @course.save
      redirect_to instructors_path(:id => current_user.id)
    else
      render 'course/course_new'
    end
  end

  private  
    def courseRegistration_params
        params.require(:courseRegistration).permit(:courseid, :studentid)
    end

    def course_params
      params.require(:course).permit(:coursecode, :name, :description, :instructorid )
    end
end
