class HomeController < ApplicationController
  def index
    @categories = Category.all.includes(:products)
    today_date = Date.today
    three_day_before = today_date - 2
    @new_products = Product.where(created_at: (three_day_before.to_date.beginning_of_day)..(today_date.to_date.end_of_day))
    @updated_products = Product.where(updated_at: (three_day_before.to_date.beginning_of_day)..(today_date.to_date.end_of_day)).and(Product.where("created_at < ?", three_day_before.to_date.beginning_of_day))
  end
end
