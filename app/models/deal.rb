class Deal < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :category

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :category_id, presence: true
  validates :user_id, presence: true
end
