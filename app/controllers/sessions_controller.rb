class SessionsController < ApplicationController
  include SessionsHelper
  helper_method :current_user
  before_filter :authorize_user, :only => :destroy

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

