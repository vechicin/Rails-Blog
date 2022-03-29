class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def like_counter
    total_likes = Like.where(post_id: post).count
    post.update(likesCounter: total_likes)
  end

  after_save :like_counter
end
