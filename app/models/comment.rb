class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def comment_counter
    total_comments = Comment.where(post_id: post).count
    post.update(commentsCounter: total_comments)
  end

  def author_name
    author.name
  end

  after_save :comment_counter
end
