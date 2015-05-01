class Notification < ActiveRecord::Base
  belongs_to :post
  belongs_to :bid
end
