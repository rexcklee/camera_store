class Order < ApplicationRecord
  has_many :order_products
  has_many :products, through: :order_products
  belongs_to :customer
  belongs_to :province

  enum :status, [ :pending, :paid, :shipped ]
end
