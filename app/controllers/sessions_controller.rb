class SessionsController < ApplicationController
  include SessionsHelper
  skip_filter :authorize_user, :only => [:create, :destroy]

  def create
    if current_user.nil?
      @current_user = User.create
      cookies.permanent[:remember_token] = @current_user.remember_token
    end
    session[:user_id] = @current_user.id
    redirect_to new_mixtape_path
  end

  def destroy    
    session[:user_id] = nil    
    redirect_to newsession_path
  end
end

