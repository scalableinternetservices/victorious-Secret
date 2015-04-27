class Bid < ActiveRecord::Base
  belongs_to :provider
  belongs_to :post

  validates :description, :amount, presence: true
  validates :amount, numericality: {greater_than_or_equal_to: 0.01}

end
