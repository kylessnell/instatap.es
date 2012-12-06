class MixtapesMailersController < ApplicationController
  include SessionsHelper
  helper_method :current_user
  before_filter :authorize_user

  def create
    @recipient_name = params[:recipient_name]
    @author_name = params[:author_name]
    @recipient_email = params[:recipient_email]
    @mixtape = Mixtape.find_by_url(params[:url])
    MixtapesMailer.mixtape_delivery(@recipient_email, @author_name).deliver
    redirect_to mixtape_play_path(@mixtape.url)
  end

end
