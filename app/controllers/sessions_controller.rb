class SessionsController < ApplicationController
  def new
  end

  def create
  	@u = User.find_by(email: params[:email])
	  	if @u && @u.authenticate(params[:password])
	  		session[:user_id] = @u.id
	  		# if @u.account_type == "lender"
	  		# redirect_to "/lender/#{session[:user_id]}"
	  		# elsif @u.account_type == "borrower"
	  		# redirect_to "/borrower/#{session[:user_id]}"
	  		end
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
