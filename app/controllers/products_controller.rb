class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    keywords_search = "%#{params[:keywords]}%"
    if params[:category] == "All"
      @products = Product.where("name LIKE ?", keywords_search).or(Product.where("description LIKE ?", keywords_search)).page(params[:page])
    else
      @products = Product.where("products.name LIKE ?", keywords_search).or(Product.where("description LIKE ?", keywords_search)).joins(:category).where("categories.name LIKE ?", params[:category]).page(params[:page])
    end
  end
end
