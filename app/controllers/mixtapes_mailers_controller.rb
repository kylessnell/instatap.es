class MixtapesMailersController < ApplicationController
  include SessionsHelper
  helper_method :current_user
  before_filter :authorize_user

  # def new
  #   @mixtape = Mixtape.find_by_url(params[:url])
  #   Pony.mail({
  #     :to => "#{params[:recipient_email]}",
  #     :via => :smtp,
  #     :body => "#{params[:recipient_name]} made you a new Instatape! Check it out here! http://www.instatap.es/#{@mixtape.url}",
  #     :via_options => {
  #       :address              => 'smtp.gmail.com',
  #       :port                 => '587',
  #       :enable_starttls_auto => true,
  #       :user_name            => 'mixtapes.yo',
  #       :password             => 'testies1234',
  #       :authentication       => :plain, 
  #       :domain               => "instatap.es" 
  #     }
  #   })
  #   redirect_to mixtape_play_path(@mixtape.url)
  # end
  
  def new
    @recipient_name = params[:recipient_name]
    @author_name = params[:author_name]
    @recipient_email = params[:recipient_email]
    @mixtape = Mixtape.find_by_url(params[:url])
    MixtapesMailer.mixtape_delivery(@recipient_email, @author_name).deliver
    redirect_to mixtape_play_path(@mixtape.url)
  end

end
