ActiveAdmin.register OrderProduct do
  menu priority: 9
  permit_params :order_id, :product_id, :quantity, :unit_price_cents
end
