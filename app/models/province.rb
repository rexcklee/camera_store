class Province < ApplicationRecord
  validates :name, :code, presence: true
  validates :pst, :gst, :hst, presence: true, numericality: true
end
