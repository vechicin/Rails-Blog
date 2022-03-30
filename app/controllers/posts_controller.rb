class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: @user.id).all
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: @post.id).all
  end
end
