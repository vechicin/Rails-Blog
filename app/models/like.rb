class Like < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post, optional: true, foreign_key: :posts_id

  def like_counter
    total_likes = Like.where(posts_id: post).count
    post.update(likesCounter: total_likes)
  end
end
