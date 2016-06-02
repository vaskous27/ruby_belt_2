class PostsController < ApplicationController
  def create
  	@user = User.find(session[:user_id])
  	post = Post.new(post_params)

  	if post.save
  		redirect_to :back
  	else
  		flash[:errors] = user.errors.full_messages
  		redirect_to :back
  	end
  end

  def index
  	@user = User.find(session[:user_id])
    @zero_post = Post.all
  	@post = Post.joins(:likes).order('COUNT(likes.id) DESC').group('posts.id')
    



  end

  def show
  	@post_show = Post.find(params[:id])
    @liked_users = Post.find_by_sql("SELECT users.name, users.alias, users.id FROM posts JOIN likes ON posts.id = likes.post_id JOIN users ON users.id = likes.user_id WHERE posts.id = '#{@post_show.id}' GROUP BY users.id ")

  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to '/posts'
  end

   private
   def post_params
   	params.require(:post).permit(:user_id, :content)
   end
end
