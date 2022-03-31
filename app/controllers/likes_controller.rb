class LikesController < ApplicationController
  before_action :find_post, :find_user

  def create
    @like = current_user.likes.new(post_id: @post.id)

    if @like.save
      redirect_to user_post_path(@user, @post)
    else
      flash[:alert] = 'Error adding like'
    end
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
