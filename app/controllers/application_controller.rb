class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def logged_in_user
    return 
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    if logged_in?
  end
end
