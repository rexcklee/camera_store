class AboutController < ApplicationController
  def index
    @abouts = About.all
  end

  def show
  end
end
