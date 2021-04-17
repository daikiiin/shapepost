class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new ,:create,:edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  def index
    @posts = Post.all.order(id: "DESC")
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
    @post = Post.find(params[:id])
  end
  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to authenticated_root_path
    else
      render :edit
    end
  end
  def destroy
    post = Post.find(params[:id])
    if post.destroy
      redirect_to authenticated_root_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:name, :explain, :training_status_id, :image).merge(user_id: current_user.id)
  end
  def move_to_index 
    @post = Post.find(params[:id])
    redirect_to authenticated_root_path if current_user.id != @post.user_id
  end  
end
