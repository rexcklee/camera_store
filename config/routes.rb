Rails.application.routes.draw do
  get "customer_info/index"
  get "customer_info/edit", to: "customer_info#edit", as: "customer_info_edit"
  post "customer_info/save", to: "customer_info#save", as: "customer_info_save"
  devise_for :customers
  get "categories/index"
  get "/categories/:id", to: "categories#show", as: "category", constraints: { id: /\d+/ }
  # get "categories/show"
  get "products/index" => "products#index", as: "products"
  # get "products/show"
  get "/products/:id", to: "products#show", as: "product", constraints: { id: /\d+/ }
  # get "products/search"
  get "/products/search/", to: "products#search", as: "products_search"

  get "about" => "about#index", as: "about"
  resources :cart, only: %i[index create destroy]
  get "cart/edit", to: "cart#edit", as: "cart_edit"
  get "cart/order_now", to: "cart#order_now", as: "cart_order_now"
  get "cart/shipping_address", to: "cart#shipping_address", as: "cart_shipping_address"
  get "cart/confirm_order", to: "cart#confirm_order", as: "cart_confirm_order"

  scope "/checkout" do
    post "create", to: "checkout#create", as: "checkout_create"
    get "success", to: "checkout#success", as: "checkout_success"
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
  end

  scope "/application" do
    get "set_menu_state_true", to: "application#set_menu_state_true", as: "application_set_menu_state_true"
    get "set_menu_state_false", to: "application#set_menu_state_false", as: "application_set_menu_state_false"
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "home#index"
end
