class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :business

  delegate :name, to: :business, prefix: true
end
