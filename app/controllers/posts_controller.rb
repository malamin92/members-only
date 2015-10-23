class PostsController < ApplicationController
	before_action :logged_in_user, only:[:new, :create]

  def new
  	@post = Post.new
  end

  def create
  end

  def index
  end

  # before filters
  def loggin_in_user
  	unless logged_in?
  		flash[:danger] = "Please log in."
  		redirect_to login_url
  	end
  end

end
