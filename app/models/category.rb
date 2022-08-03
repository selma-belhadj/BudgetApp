class Category < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :deals, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :user_id, presence: true
end
