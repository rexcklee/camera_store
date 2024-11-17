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
    product_id = session[:cart]
    Product.find(product_id)
  end
end
