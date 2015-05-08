class Consumer < ActiveRecord::Base
  belongs_to :user
  has_many :posts, dependent: :destroy

  has_many :proreviews
end
