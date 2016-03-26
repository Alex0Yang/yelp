class Business < ActiveRecord::Base
  delegate :name, to: :category, prefix: true

  belongs_to :category
  has_many :reviews

  validates_presence_of :name, :category

  def has_review?
    reviews.count > 0
  end

  def last_review
    reviews.last
  end

  def last_review_user
    last_review.user if has_review?
  end

  def last_review_user_name
    last_review.user_full_name if has_review?
  end

  def last_review_time
    last_review.created_at if has_review?
  end
end
