class Category < ApplicationRecord
  has_many :labels
  has_many :products, through: :labels
  validates :name, length: { minimum: 3 }
end
