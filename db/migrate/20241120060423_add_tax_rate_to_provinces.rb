class AddTaxRateToProvinces < ActiveRecord::Migration[8.0]
  def change
    add_column :provinces, :pst, :decimal, precision: 5, scale: 3
    add_column :provinces, :gst, :decimal, precision: 5, scale: 3
    add_column :provinces, :hst, :decimal, precision: 5, scale: 3
  end
end
