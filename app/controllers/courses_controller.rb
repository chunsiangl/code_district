class CoursesController < ApplicationController
	def index
		@courses = Course.all
	end

	def new
		@courses = Course.new
	end

	def create
		@courses = Course.create(course_params)
		redirect_to @courses
end


private

	def course_params
		 params.require(:course).permit(:title, :description, :duration, :max_student)
	end

end
