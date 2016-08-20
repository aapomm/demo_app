class SessionsController < ApplicationController

  skip_before_action :redirect_to_signin_path,
    :only => :destroy,
    :if => :signed_out?


  def new
  end


  def create

    user = UserAuthenticator.new(params[:username]).authenticate params[:password]

    if user
      session[:user_id] = user.id
      redirect_to :root, :notice => 'Logged in successfully.'

    else
      flash.now[:error] = 'Your login or password is invalid. Please try again.'
      render :new
    end
  end


  def destroy
    session[:user_id] = nil

    redirect_to [:signin], :notice => 'Logged out successfully.'
  end

end
