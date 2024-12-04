class Product < ApplicationRecord
  belongs_to :category
  belongs_to :brand

  has_many :order_products
  has_many :orders, through: :order_products

  has_one_attached :image

  validates :category_id, :brand_id, :name, presence: true
  validates :stock_quantity, :price_cents, presence: true, numericality: { only_integer: true }
end
