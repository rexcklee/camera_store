class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :load_store_contact

  before_action :initialize_session

  helper_method :cart

  def set_menu_state_true
    session[:menu_state] = true
    logger.debug("Change menu state to true: #{session[:menu_state]}")
    redirect_back(fallback_location: root_path)
  end

  def set_menu_state_false
    session[:menu_state] = false
    logger.debug("Change menu state to false: #{session[:menu_state]}")
    redirect_back(fallback_location: root_path)
  end

  private
  def load_store_contact
    @main_store_contact = StoreContact.first
  end

  def initialize_session
    session[:cart] ||= []
    session[:address] ||= nil
    session[:province] ||= nil
    session[:menu_state] ||= false
  end

  def cart
    cart_products_array = session[:cart]
    product_ids_array = cart_products_array.map { |product| product["id"] }
    Product.order(:name).find(product_ids_array)
  end
end
