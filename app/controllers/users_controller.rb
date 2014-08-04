class UsersController < ApplicationController
  def new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to root_path, notice: "Welcome aboard!"
  	else
  		render :new
  	end	
  end

  def edit
  end

  def index
  end

  def show
  end

  private
  def user_params
  	params.require(:user).permit(:name)
  end
end
