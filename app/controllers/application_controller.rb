class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :load_store_contact

  before_action :initialize_session

  helper_method :cart

  private
  def load_store_contact
    @main_store_contact = StoreContact.first
  end

  def initialize_session
    session[:cart] ||= []
  end

  def cart
    cart_products_array = session[:cart]
    product_ids_array = cart_products_array.map { |product| product["id"] }
    Product.order(:name).find(product_ids_array)
  end
end
