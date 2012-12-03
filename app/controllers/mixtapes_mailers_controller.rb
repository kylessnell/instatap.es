class MixtapesMailersController < ApplicationController

  def create
    @recipient_name = params[:recipient_name]
    @author_name = params[:author_name]
    @mixtape = Mixtape.find_by_url(params[:url])
    MixtapesMailer.mixtape_delivery(params[:recipient_email]).deliver
    redirect_to mixtape_play_path(@mixtape.url)
  end

end
