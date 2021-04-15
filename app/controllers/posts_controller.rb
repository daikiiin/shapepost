class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new ,:create]
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:name, :explain, :training_status_id, :image)
  end
end
