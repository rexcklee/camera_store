class Category < ApplicationRecord
  has_many :products

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [ 100, 100 ]
    attachable.variant :small_img, resize_to_limit: [ 300, 300 ]
    attachable.variant :large_img, resize_to_limit: [ 500, 500 ]
  end

  validates :name, presence: true, uniqueness: true
end
