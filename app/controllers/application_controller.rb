class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session

  helper_method :signed_in?, :signed_out?

  def current_user
    @current_user ||= Admin.where(:id => session[:user_id]).first
  end


  def signed_in?
    !self.signed_out?
  end


  def signed_out?
    !self.current_user
  end


end
