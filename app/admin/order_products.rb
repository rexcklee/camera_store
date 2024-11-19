ActiveAdmin.register OrderProduct do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :order_id, :product_id, :quantity, :unit_price_cents

  #
  # or
  #
  # permit_params do
  #   permitted = [:order_id, :product_id, :quantity, :unit_price_cents]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
