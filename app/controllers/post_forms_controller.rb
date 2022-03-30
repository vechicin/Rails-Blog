class PostFormsController < ApplicationController
  def new
    post = Post.new
    respond_to do |format|
      format.html {render :new, locals: {post: post}}
    end
  end
end