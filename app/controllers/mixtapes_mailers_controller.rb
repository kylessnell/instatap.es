class MixtapesMailersController < ApplicationController

  def create
    @recipient_name = params[:recipient_name]
    @author_name = params[:author_name]
    MixtapesMailer.mixtape_delivery(params[:recipient_email]).deliver
    redirect_to mixtape_path(params[:mixtape])
  end

end
