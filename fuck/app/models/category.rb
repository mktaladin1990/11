class Category < ApplicationRecord
    has_many :medials
    has_many :products, through: :medials
    validates :name, length: { minimum: 3 }
end
