class CartController < ApplicationController
  def create
    product_id = params[:id].to_i
    unless session[:cart].include?(product_id)
      # session[:cart] << { "id": product_id, "qty": 1 }
      session[:cart] << product_id
      flash[:notice] = "Item added."
    end
    # logger.debug("Session Cart: #{session[:cart]}")
    redirect_back(fallback_location: root_path)
  end

  def destroy
    product_id = params[:id].to_i
    if session[:cart].include?(product_id)
      session[:cart].delete(product_id)
      flash[:notice] = "Item removed."
    end
    redirect_back(fallback_location: root_path)
  end
end
