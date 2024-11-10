ActiveAdmin.register StoreContact do
  menu priority: 6
  permit_params :location, :phone, :email, :open_mon, :open_tue, :open_wed, :open_thu, :open_fri, :open_sat, :open_sun
end
