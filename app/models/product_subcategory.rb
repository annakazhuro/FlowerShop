class ProductSubcategory < ApplicationRecord
  has_many :products
  belongs_to :subcategory
  belongs_to :category
end
