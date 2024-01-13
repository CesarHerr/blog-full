class Post < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_many :comments, foreign_key: :post_id, dependent: :destroy
  has_many :likes, foreign_key: :post_id, dependent: :destroy

  validates :title, presence: true, length: { maximum: 100 }
  validates :text, presence: true, length: { maximum: 1000 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  after_create :user_post_counter
  after_destroy :user_post_counter

  def user_post_counter
    user.update_column(:post_counter, user.posts.count)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
