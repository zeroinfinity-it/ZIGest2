class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def new
  		@user = User.new
  end
  def show
  		@user = User.find(params[:id])
      @invoices = @user.invoices.paginate(page: params[:page])
  end

  def create
  		@user = User.new(user_params)    # Not the final implementation!
    	if @user.save
        sign_in @user
        flash[:success] = "Benvenuti in ZIGest!"
    	  redirect_to @user
    	else
     	 render 'new'
    	end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Utente eliminato."
    redirect_to users_url
  end



	private

  	def user_params
  	  params.require(:user).permit(:nome, :cognome, :eta, :email, :password,
  	                               :password_confirmation)
  	end

    # Before filters

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
