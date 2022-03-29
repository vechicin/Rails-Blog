class Post < ApplicationRecord
  belongs_to :user, optional: true, foreign_key: :users_id
  has_many :likes, foreign_key: :posts_id
  has_many :comments, foreign_key: :posts_id

  def post_counter
    total_posts = Post.where(users_id: user).count
    user.update(postsCounter: total_posts)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
