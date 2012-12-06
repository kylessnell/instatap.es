class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize_user
  helper_method :current_user

  def authorize_user
    Rails.logger.info "Checki"
    if (current_user && current_user.id != session[:user_id]) || current_user.nil?
      redirect_to root_url 
    end
  end

private

  # def find_user
  #   if session[:user_id]
  #     User.find(session[:user_id])
  #   elsif cookies[:remember_token]
  #     User.find_by_remember_token(cookies[:remember_token])
  #   end
  # end

  def yt_client
    @yt_client ||= YouTubeIt::Client.new(:dev_key => "AI39si6i1YvfcT64qFK06lhB9oT_4NuGkRnSHmyrH7XmFkOx6jtLimBtDl-NOX7-RSqqcBKH-RpuJHae3Xo6ulUT8paIk9Nh1w")
  end
end

