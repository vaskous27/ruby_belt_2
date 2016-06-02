class UsersController < ApplicationController
  def new
  end

  def create
  	user = User.new(user_params)

  	if user.save
  		redirect_to :root
  	else
  		flash[:errors] = user.errors.full_messages
  		redirect_to :back
  	end
  end

  def show
  	@user_show = User.find(params[:id])
  end

  private
   def user_params
   	params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
   end
end
