class CategoriesController < ApplicationController
  def index
  end

  def show
    @products = Product.where(category_id: params[:id])
  end
end
