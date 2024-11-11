class HomeController < ApplicationController
  def index
    @categories = Category.all.includes(:products)
  end
end
