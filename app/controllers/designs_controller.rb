class DesignsController < ApplicationController

  def new
    @mixtape = Mixtape.find_by_url(params[:url])
  end
  
end
