class CommentsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params.require(:comment).permit(:text))
    @comment.author_id = @user.id

    if @comment.save
      redirect_to user_post_path(@user, @post)
    else
      flash[:alert] = "Could not post comment"
      render :new
    end
  end
end