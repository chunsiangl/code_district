class CoursesController < ApplicationController
	def index
		if current_user != nil
			@usercourse = UserCourse.new
			@courses = Course.all
		else
			flash[:notice] = "Please login first"
			redirect_to root_path
		end
	end

	def new
		@courses = Course.new
	end

	def create
		@courses = Course.create(course_params)
		redirect_to @courses
	end

	def show
		@course = Course.find(params[:id])
		@usercourse = UserCourse.new

	end

	def search
		if params[:search]
			@course = Course.search(params[:search])
			@course = @course.order(:title).paginate(:page => params[:page], :per_page => 10)
			@usercourse = UserCourse.new
		end
    end

	def verify
		if current_user.admin?
	        @courses = Course.find(params[:id])
	        @courses.verified = true
	        @courses.save
	        redirect_to courses_path
        end 
    end



private

	def course_params
		 params.require(:course).permit(:title, :description, :duration, :max_student, :verified, :venue)
	end

end
