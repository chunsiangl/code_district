class UserCoursesController < ApplicationController
	def attend
		@user_courses = UserCourse.new(user_course_params)
		if @user_courses.course.max_student > UserCourse.where(course_id: @user_courses.course.id).count
			if UserCourse.find_by(user_course_params) == nil
				@user_courses.save
				flash[:notice] = "Thank you for your interest. We will contact you soon."
			else
				flash[:notice] = "You have registered for this course."
			end
		else
			flash[:notice] = "This course is full."
		end
		redirect_to courses_path
	end


private
	def user_course_params
	  params.require(:user_course).permit(:user_id, :course_id)
	end
end