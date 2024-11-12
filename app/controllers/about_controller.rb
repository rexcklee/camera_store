class AboutController < ApplicationController
  def index
    @abouts = About.all
    @store_contacts = StoreContact.all
  end

  def show
  end
end
