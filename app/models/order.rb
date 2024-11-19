class Order < ApplicationRecord
  has_many :order_products
  has_many :products, through: :order_products

  enum :status, [ :pending, :completed ]
  enum :province, [ :AB, :BC, :MB, :NB, :NL, :NT, :NS, :NU, :ON, :PE, :QC, :SK, :YT ]
end
