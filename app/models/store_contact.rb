class StoreContact < ApplicationRecord
  validates :location, presence: true, uniqueness: true
  validates :phone, :email, presence: true
end
