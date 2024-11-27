ActiveAdmin.register Order do
  menu priority: 8

  permit_params :number, :address, :status, :province_id, :total_cents, :total_tax_rate, :customer_id, order_product_ids: []

  index do
    selectable_column
    id_column
    column :number
    column :customer
    column :address
    column :status
    column :province
    column "Total" do |order|
      number_to_currency order.total_cents/100.0
    end
    column "Total(with Tax)" do |order|
      number_to_currency (order.total_cents*(1+order.total_tax_rate)).to_i/100.0
    end
    column :created_at
    column :updated_at

    column "Products" do |order|
      table_for order.order_products do
        column "Name" do |order_product|
          link_to order_product.product.name, [ :admin, order_product ]
        end
        column :quantity
        column "Unit Price" do |order_product|
          number_to_currency order_product.unit_price_cents/100.0
        end
        # column :unit_price_cents
      end
    end

    actions
  end
end
