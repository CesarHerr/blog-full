class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :comment, presence: true, length: { maximum: 500 }

  after_create :post_comment_counter
  after_destroy :post_comment_counter

  def post_comment_counter
    post.update_column(:comments_counter, post.comments.count)
  end
end
