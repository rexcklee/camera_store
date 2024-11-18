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
  def checkout
    tax_rate = {
                  AB: [ 0, 0.05, 0 ],
                  BC: [ 0.07, 0.05, 0 ],
                  MB: [ 0.07, 0.05, 0 ],
                  NB: [ 0, 0, 0.15 ],
                  NL: [ 0, 0, 0.15 ],
                  NT: [ 0, 0.05, 0 ],
                  NS: [ 0, 0, 0.15 ],
                  NU: [ 0, 0.05, 0 ],
                  ON: [ 0, 0, 0.13 ],
                  PE: [ 0, 0, 0.15 ],
                  QC: [ 0.09975, 0.05, 0 ],
                  SK: [ 0.06, 0.05, 0 ],
                  YT: [ 0, 0.05, 0 ]
               }
    @gst = 0
    @pst = 0
    @hst = 0
    if session[:province].present?
      @gst = tax_rate[session[:province].to_sym][0]
      @pst = tax_rate[session[:province].to_sym][1]
      @hst = tax_rate[session[:province].to_sym][2]
    end
  end

  def shipping_address
    session[:address] = params[:address]
    session[:province] = params[:province]
    redirect_back(fallback_location: root_path)
  end

  def order
    address = params[:address]
    province = params[:province]
    total_cents = params[:total_cents]
    @order = Order.new(address: address, province: province, total_cents: total_cents)

    if @order.save
      redirect_back(fallback_location: root_path)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
