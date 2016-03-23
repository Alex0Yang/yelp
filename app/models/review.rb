class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :business

  delegate :full_name, to: :user, prefix: true
  delegate :name, to: :business, prefix: true
  validates_presence_of :content
  validates_numericality_of :rate, only_integer: true
  validates_uniqueness_of :user_id, scope: :business_id
end
