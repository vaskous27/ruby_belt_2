class SessionsController < ApplicationController
  def new
  end

  def create
  	@u = User.find_by(email: params[:email])
	  	if @u && @u.authenticate(params[:password])
	  		session[:user_id] = @u.id
	  		
	  		redirect_to "/posts"
	  
	  	else
	  		flash[:errors] = ['Invalid email / password combination']
	  		redirect_to :back
	  	end
  end

  def destroy
  	session[:user_id] = nil
	  	redirect_to '/'
  end
end
