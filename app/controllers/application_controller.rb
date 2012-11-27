class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

private

	def yt_client
		@yt_client ||= YouTubeIt::Client.new(:dev_key => "AI39si6i1YvfcT64qFK06lhB9oT_4NuGkRnSHmyrH7XmFkOx6jtLimBtDl-NOX7-RSqqcBKH-RpuJHae3Xo6ulUT8paIk9Nh1w")
	end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  

  helper_method :current_user

end


