class DesignsController < ApplicationController

  def new
    @mixtape = Mixtape.find_by_mixtape_url(params[:mixtape_url])
  end
  
end
