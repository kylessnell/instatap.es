class MixtapesController < ApplicationController
  include SessionsHelper
  helper_method :current_user
  before_filter :authorize_user, :only => [:new, :create, :update]
  
  def new
    @song = Song.new
    @mixtape = Mixtape.new
  end

  def create
    @mixtape = Mixtape.create(params[:mixtape])
    @mixtape.user_id = session[:user_id]
    
    if @mixtape.save
      session[:mixtape_id] = @mixtape.id
      redirect_to new_design_path(:url => @mixtape.url)
    else
      render :new
    end
  end

  def show
    @mixtape = Mixtape.find_by_url(params[:url])
  end

  def update
    @mixtape = Mixtape.find(params[:id])
    if @mixtape.update_attributes(params[:mixtape])
      redirect_to mixtape_play_path(@mixtape.url)
    end
  end

end