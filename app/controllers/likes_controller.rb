class LikesController < ApplicationController
  def create
  	like = Like.new(likes_params)
  	if like.save
  		redirect_to :back
  	else
  		flash[:errors] = like.errors.full_messages
  		redirect_to :back
  	end
  end

  def likes_params
   	params.require(:like).permit(:user_id, :post_id)
   end
end
