class AddTotalTaxRateToOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :total_tax_rate, :decimal, precision: 5, scale: 3
  end
end
