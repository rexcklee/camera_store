class CheckoutController < ApplicationController
  def create
    order_number = params[:order_number].to_i
    order = Order.find_by(number: order_number)
    tax_rate = order.total_tax_rate
    logger.debug(order.order_products.count)
    line_items = []
    order.order_products.each do |order_product|
      line_item = {
        price_data: {
        currency: "cad",
        product_data: {
          name: order_product.product.name
        },
        unit_amount: (order_product.unit_price_cents * (1 + tax_rate)).to_i
      },
      quantity: order_product.quantity
      }
      line_items.append(line_item)
    end

    if order.order_products.nil?
      redirect_to root_path
      return
    end

    # Establish connection with Stripe
    session = Stripe::Checkout::Session.create(
      payment_method_types: [ "card" ],
      success_url: "#{checkout_success_url}?order_id=#{order.id}",
      cancel_url: checkout_cancel_url,
      mode: "payment",
      line_items: line_items
    )

    redirect_to session.url, allow_other_host: true
  end

  def success
    order_id = params[:order_id]
    order = Order.find(order_id)
    order.update(status: 1)
  end

  def cancel
  end
end
