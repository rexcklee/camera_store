class CustomerInfoController < ApplicationController
  def show
    @customer_info = Customer.find(params[:id])
  end

  def edit
    # @customer_info = Customer.find(params[:id].to_i)
    @customer_info = Customer.find(current_customer.id)
  end

  def save
    logger.debug("Address is: #{params[:address]}, Name is: #{params[:name]}, Province is: #{params[:province]}")
    # edit_customer = Customer.find(params[:id].to_i)
    edit_customer = Customer.find(current_customer.id)
    edit_customer.update(name: params[:name], address: params[:address], province_id: params[:province])
    # @customer_info.update(name: params[:name])
    # @customer_info.name = params[:name]
    # @customer_info.address = params[:address]
    # @customer_info.province = params[:province]
    # @customer_info.save
    redirect_back(fallback_location: root_path)
  end
end
