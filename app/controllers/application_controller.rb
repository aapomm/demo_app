class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session

  before_action :redirect_to_signin_path, :if => :signed_out?


  def current_user
    @current_user ||= Admin.where(:id => session[:user_id]).first
  end


  def signed_in?
    !self.signed_out?
  end


  def signed_out?
    !self.current_user
  end


  def redirect_to_signin_path options = {}
    redirect_to :signin, options
  end

end
