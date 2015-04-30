class Post < ActiveRecord::Base
  belongs_to :consumer
  belongs_to :provider
  serialize :categories, Array

  mount_uploader :picture, PictureUploader

  validates :title, :description, :price,   presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  default_scope order('created_at DESC')

  has_many :bids, dependent: :destroy
  searchable do
    text :title
    text :description
    text :categories
  end

end
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																			