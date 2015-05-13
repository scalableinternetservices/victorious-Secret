class Notification < ActiveRecord::Base
  belongs_to :post
  belongs_to :bid

  validates :post, :bid, :presence => true
end
