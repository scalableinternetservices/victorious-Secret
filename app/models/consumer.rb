class Consumer < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  has_many :posts, dependent: :destroy

  has_many :proreviews
end
