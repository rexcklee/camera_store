class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :load_store_contact

  private
  def load_store_contact
    @store_contact = StoreContact.first
  end
end
