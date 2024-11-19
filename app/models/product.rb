class Product < ApplicationRecord
  belongs_to :category
  belongs_to :brand

  has_many :order_products
  has_many :orders, through: :order_products

  has_one_attached :image
end
