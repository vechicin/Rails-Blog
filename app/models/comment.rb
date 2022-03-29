class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post, optional: true, foreign_key: :posts_id

  def comment_counter
    total_comments = Comment.where(posts_id: post).count
    post.update(commentsCounter: total_comments)
  end
end
