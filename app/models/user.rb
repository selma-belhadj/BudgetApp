class User < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :deals, dependent: :destroy
  validates :name, presence: true, length: { maximum: 50 }
end
