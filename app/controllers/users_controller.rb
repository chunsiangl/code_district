class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		 @user = User.new(user_params)
		  if @user.save
		    session[:user_id] = @user.id
		    redirect_to '/'
		    flash[:notice] = "Signed up and logged in."
		  else
		    redirect_to '/signup'
		  	flash[:notice] = @user.errors.full_messages.join(", ")
		  end
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
        	flash[:notice] = "Profile updated."
        else
        	flash[:notice] = "Please login first."
		end
			redirect_to @user
	end

end

private
def user_params
  params.require(:user).permit(:first_name, :last_name, :email, :password)
end

