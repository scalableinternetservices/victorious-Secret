class Provider < ActiveRecord::Base
  belongs_to :user
  has_many :bids, dependent: :destroy

  has_many :posts
  has_many :conreview
  
end
