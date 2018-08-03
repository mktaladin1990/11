class Product < ApplicationRecord
    has_many :medials
    has_many :categories, through: :medials
    validates :name, length: { minimum: 3 }
    accepts_nested_attributes_for :categories

end
