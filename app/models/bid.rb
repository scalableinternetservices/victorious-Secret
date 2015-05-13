class Bid < ActiveRecord::Base
  belongs_to :provider
  belongs_to :post
  has_one :notification
  validates :description, :amount, :post,  presence: true
  validates :amount, numericality: {greater_than_or_equal_to: 0.01}

  before_create :ensure_user_has_not_bid_already


  private

  def ensure_user_has_not_bid_already
  	post.bids.each do |bid|
  		if bid.provider == provider
  			errors.add(:base, 'You have already bid on this item')
			return false
		else
			return true
		end
	end
  end


end
