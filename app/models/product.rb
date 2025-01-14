class Product < ApplicationRecord
  belongs_to :category
  belongs_to :brand

  has_many :order_products
  has_many :orders, through: :order_products

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [ 100, 100 ]
    attachable.variant :small_img, resize_to_limit: [ 300, 300 ]
    attachable.variant :large_img, resize_to_limit: [ 500, 500 ]
  end

  validates :category_id, :brand_id, :name, presence: true
  validates :stock_quantity, :price_cents, presence: true, numericality: { only_integer: true }
end
