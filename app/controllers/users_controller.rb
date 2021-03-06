class UsersController < ApplicationController

  def index
  	@users = User.all
  	#authorize User
  end

  def show
  	@user = User.find(params[:id])
  	authorize @user
  end

  def destroy
  	user = User.find(params[:id])
  	user.destroy
  	redirect_to users_path, :notice => 'User deleted'
  end
  
  private
  
  	def secure_params
  		params.require(:user).permit(:role)
  	end
end
