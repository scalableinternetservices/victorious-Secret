class Post < ActiveRecord::Base
  belongs_to :consumer

  mount_uploader :picture, PictureUploader

  validates :title, :description, presence: true
  
end
