class SessionsController < ApplicationController
  skip_filter :authorize_user, :only => [:create, :destroy]

  def create
    user = User.create
    cookies.permanent.signed[:remember_token] = user.remember_token
    #session[:user_id] = user.id
    redirect_to new_mixtape_path
  end

  def destroy
    #user = nil
    cookies.delete(:remember_token)
    # clear_session
    redirect_to root_url
  end
end

