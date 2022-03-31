class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: @user.id).all
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: @post.id).all
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(params.require(:post).permit(:title, :text))
    @post.commentsCounter = 0
    @post.likesCounter = 0

    if @post.save
      redirect_to user_posts_path(@user)
    else
      flash[:alert] = "Post could not be published"
      render :new
    end
  end
end
