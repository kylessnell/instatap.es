class SessionsController < ApplicationController
  skip_filter :authorize_user, :only => [:create, :destroy]

  def create
    user = User.create
    cookies.permanent.signed[:remember_token] = user.remember_token
    #session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    puts "Im in the destroy method"
    #user = nil
    cookies.delete(:remember_token)
    #session[:user_id] = nil
    redirect_to root_url

  end 
end

