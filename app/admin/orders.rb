ActiveAdmin.register Order do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :number, :address, :status, :province, :total_cents, order_product_ids: []

  index do
    selectable_column
    id_column
    column :number
    column :address
    column :status
    column :province
    column :total_cents

    column "Products" do |order|
      table_for order.order_products do
        column "Name" do |order_product|
          link_to order_product.product.name, [ :admin, order_product ]
        end
        column :quantity
        column :unit_price_cents
      end
    end
    actions
  end

  #
  # or
  #
  # permit_params do
  #   permitted = [:number, :address, :status, :province, :total_cents]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
