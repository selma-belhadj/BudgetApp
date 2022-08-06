class Category < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :deals, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :icon, presence: true
  validates :user_id, presence: true

  def total_amount
    sum = 0
    deals.each do |deal|
      sum += deal.amount
    end
    sum
  end
end
