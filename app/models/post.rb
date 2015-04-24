class Post < ActiveRecord::Base
  belongs_to :consumer

  mount_uploader :picture, PictureUploader

  validates :title, :description, :price,  presence: true
  default_scope order('created_at DESC')
end
