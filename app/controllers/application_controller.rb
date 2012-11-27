class ApplicationController < ActionController::Base
  protect_from_forgery

	private

		def yt_client
		  @yt_client ||= YouTubeIt::Client.new(:dev_key => "AI39si6i1YvfcT64qFK06lhB9oT_4NuGkRnSHmyrH7XmFkOx6jtLimBtDl-NOX7-RSqqcBKH-RpuJHae3Xo6ulUT8paIk9Nh1w")
		end

end


