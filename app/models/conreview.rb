class Conreview < ActiveRecord::Base
  belongs_to :provider
  belongs_to :post

  validates :rating, :description, :provider, :post, presence: true
  validates :rating, numericality: {only_integer: true, less_than_or_equal_to: 5, greater_than_or_equal_to: 0}
end
