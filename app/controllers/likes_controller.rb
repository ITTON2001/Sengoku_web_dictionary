class LikesController < ApplicationController
  before_action :authenticate_user

  #タメになった！を押せる機能
  def create
    @post = Post.find_by(id: params[:post_id])
    @user = User.find_by(id: @post.user_id)
    @like = Like.new(
      user_id: @current_user.id,
      post_id: params[:post_id]
    )
    @like.save
    redirect_to("/posts/#{params[:post_id]}")
  end

  #タメになった！を外せる機能
  def destroy
    @post = Post.find_by(id: params[:post_id])
    @user = User.find_by(id: @post.user_id)
    @like = Like.find_by(user_id: @current_user.id, post_id: params[:post_id])
    @like.destroy
    redirect_to("/posts/#{params[:post_id]}")
  end
end