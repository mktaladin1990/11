class Product < ApplicationRecord
  has_many :labels
  has_many :categories, through: :labels
  validates :name, length: { minimum: 3 }
end
