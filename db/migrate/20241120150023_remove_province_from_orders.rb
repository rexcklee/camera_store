class RemoveProvinceFromOrders < ActiveRecord::Migration[8.0]
  def change
    remove_column :orders, :province, :string
  end
end
