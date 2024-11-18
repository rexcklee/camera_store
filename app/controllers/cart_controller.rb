class CartController < ApplicationController
  def index
  end
  def create
    product_id = params[:id].to_i
    cart_products = session[:cart]
    product_ids_array = cart_products.map { |product| product["id"] }
    unless product_ids_array.include?(product_id)
      session[:cart] << { "id": product_id, "qty": 1 }
      flash[:notice] = "Item added."
    end
    logger.debug("Cart session: #{session[:cart]}")
    redirect_back(fallback_location: root_path)
  end

  def destroy
    product_id = params[:id].to_i
    if (delete_product = session[:cart].find { |product| product["id"]==product_id })
      session[:cart].delete(delete_product)
      flash[:notice] = "Item removed."
    end
    redirect_back(fallback_location: root_path)
  end

  def edit
    product_id = params[:id].to_i
    updated_quantity = params[:quantity]
    if (edit_product = session[:cart].find { |product| product["id"]==product_id })
      session[:cart].delete(edit_product)
      session[:cart] << { "id": product_id, "qty": updated_quantity }
    end
    redirect_back(fallback_location: root_path)
  end
end
