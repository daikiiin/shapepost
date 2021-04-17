class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new ,:create,:edit, :update]
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to authenticated_root_path
    else
      render :new
    end
  end
  def edit
    @post = Post.find(paramas[:id])
  end
  def update
    post = Post.find(paramas[:id])
    post.update(post_params)
  end

  private
  def post_params
    params.require(:post).permit(:name, :explain, :training_status_id, :image).merge(user_id: current_user.id)
  end
end
