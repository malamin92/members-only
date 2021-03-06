class PostsController < ApplicationController
	before_action :logged_in_user, only:[:new, :create]

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
    @post.user_id = current_user.id
  	if @post.save
  		flash[:success] = "Post created"
  		redirect_to posts_path
  	else
      flash.now[:danger] = "Try again."
  		render 'posts/new'
  	end
  end


  def index
  	@posts = Post.all
  end

  # before filters
  def logged_in_user
  	unless logged_in?
  		flash[:danger] = "Please log in."
  		redirect_to login_url
  	end
  end

  private

  def post_params
  	params.require(:post).permit(:story)
  end

end
