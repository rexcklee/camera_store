class AddDetailsToCustomers < ActiveRecord::Migration[8.0]
  def change
    add_column :customers, :name, :string
    add_column :customers, :address, :string
    add_column :customers, :province, :integer
  end
end
