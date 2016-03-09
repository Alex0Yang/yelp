class Business < ActiveRecord::Base
  delegate :name, to: :category, prefix: true

  belongs_to :category

  validates_presence_of :name, :category
end
