class Post < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :commentsCounter, comparison: { greater_than_or_equal_to: 0 }
  validates :likesCounter, comparison: { greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def post_counter
    total_posts = Post.where(author_id: author).count
    author.update(postsCounter: total_posts)
  end

  def recent_comments
    comments.order(created_at: :desc).includes(:post).limit(5)
  end

  after_save :post_counter
end
