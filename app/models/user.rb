class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :age, :phone, :address, presence: true
  validates :age, numericality: {greater_than_or_equal_to: 18}
  validates :phone, uniqueness: true

  has_one :consumer, dependent: :destroy 
  has_one :provider, dependent: :destroy

  #auto indexer plus name index
  searchable do
    text :name
  end
end
