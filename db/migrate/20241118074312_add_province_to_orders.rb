class AddProvinceToOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :province, :integer, default: 0
  end
end
