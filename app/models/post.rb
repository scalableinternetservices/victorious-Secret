class Post < ActiveRecord::Base
  belongs_to :consumer
  serialize :categories, Array

  mount_uploader :picture, PictureUploader

  validates :title, :description, :price,   presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  default_scope order('created_at DESC')
end
