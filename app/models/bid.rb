class Bid < ActiveRecord::Base
  belongs_to :provider
  belongs_to :post
end
