class QueueItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :video

  delegate :category, to: :video
  delegate :title, to: :video, prefix: :video

  def rating
    review = Review.where(video: video, user: user).first
    review.rating if review
  end

  def category_name
    category.name
  end
end