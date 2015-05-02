class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :age, :phone, :address, presence: true
  validates :age, numericality: {greater_than_or_equal_to: 18}
  validates :phone, uniqueness: true, format: {with: /\d{10}/, message: 'please enter a valid phone number'}

  has_one :consumer, dependent: :destroy 
  has_one :provider, dependent: :destroy 
end
