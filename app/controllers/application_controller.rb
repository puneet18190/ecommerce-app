class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  helper_method :current_order
  def current_order
    if  !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def user_is_admin
    return if user_signed_in? && current_user.admin?

    flash[:info] = "You don't have the privilages for this action!"
    redirect_back(fallback_location: root_url)
  end
end
