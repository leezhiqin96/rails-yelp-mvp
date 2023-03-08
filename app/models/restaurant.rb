class Restaurant < ApplicationRecord
  validates :category, inclusion: { in: %w[chinese italian japanese french belgian] }
  validates :name, :address, presence: true
  has_many :reviews, dependent: :destroy
end
