class Provider < ActiveRecord::Base
  belongs_to :user
  validates :user,presence: true
  has_many :bids, dependent: :destroy

  has_many :posts
  has_many :conreview
  
end
