class AddTotalCentsToOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :total_cents, :integer
  end
end
