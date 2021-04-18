class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    post = user.posts
    @nickname = user.nickname
    @posts = post.order(id: "DESC")
  end
end
