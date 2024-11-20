class RemoveProvinceFromCustomers < ActiveRecord::Migration[8.0]
  def change
    remove_column :customers, :province, :string
  end
end
