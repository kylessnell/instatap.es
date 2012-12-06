class StaticPagesController < ApplicationController
  include SessionsHelper
  helper_method :current_user
  skip_filter :authorize_user
   
  def home
  	if Mixtape.find_by_url('6570d3')
	    @mixtape = Mixtape.find_by_url('6570d3')
	  else 
	  	@mixtape = Mixtape.last
	  end
  end
end
