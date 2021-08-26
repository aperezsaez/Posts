class LikesController < ApplicationController
  before_action :authenticate_user!

  def to_like
    post = Post.find(params[:id])
    flash[:notice] = "No puedes dar dos likes sobre el mismo post" if post.likes.pluck(:user_id).include?(current_user.id)
    new_like = Like.create(post: post, user: current_user)
    redirect_to root_path
  end

  def to_dislike
    post = Post.find(params[:id])
    like = post.likes.find_by(user_id: current_user.id)
    like.destroy
    redirect_to root_path
  end
end
