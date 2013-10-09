class UsersController < ApplicationController
  def new
  		@user = User.new
  end
  def show
  		@user = User.find(params[:id])
  end

  def create
  		flash[:success] = "Welcome to the Sample App!"
  		@user = User.new(user_params)    # Not the final implementation!
    	if @user.save
    	  redirect_to @user
    	else
     	 render 'new'
    	end
  end


	private

	def user_params
	  params.require(:user).permit(:nome, :cognome, :eta, :email, :password,
	                               :password_confirmation)
	end

end
