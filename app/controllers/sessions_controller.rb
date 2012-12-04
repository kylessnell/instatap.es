class SessionsController < ApplicationController
  include SessionsHelper
  skip_filter :authorize_user, :only => [:create, :destroy]

  def create
    if current_user.nil?
      puts "Current user ID is #{@current_user.id}" if @current_user
      @current_user = User.create
      cookies.permanent[:remember_token] = @current_user.remember_token
      puts "I just made a new user"
    end
    puts "*" * 100
    puts "Current User ID in the session controller is #{@current_user.id}"
    session[:user_id] = @current_user.id

    redirect_to new_mixtape_path
    # respond_to do |format|
    #   format.html { redirect_to new_mixtape_path }
    #   format.json { render :json => { :html => render(partial: 'mixtapes/new_mixtape') } }
    # end
  end

  def destroy
    session[:user_id] = nil
    redirect_to newsession_path
  end
end

