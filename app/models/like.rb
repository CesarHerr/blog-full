class Like < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  belongs_to :post, foreign_key: :post_id

  after_create :post_like_counter
  after_destroy :post_like_counter

  def post_like_counter
    post.update_column(:likes_counter, post.likes.count)
  end
end
