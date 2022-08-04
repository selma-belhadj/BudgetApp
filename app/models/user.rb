class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :categories, dependent: :destroy
  has_many :deals, dependent: :destroy
  validates :name, presence: true, length: { maximum: 50 }

  def total_amount
    sum = 0
    categories.each do |category|
      category.deals.each do |deal|
        sum += deal.amount
      end
    end
    sum
  end
end
