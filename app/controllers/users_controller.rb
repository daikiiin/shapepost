class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    post = user.posts
    @nickname = user.nickname
    @height = user.height
    @weight = user.weight
    @age = user.age
    @user_sex = user.sex
    @user_goal = user.training_goal
    @posts = post.order(id: "DESC")
  end
end
