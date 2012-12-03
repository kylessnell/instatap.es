class MixtapesController < ApplicationController
  include SessionsHelper
  
  def index
  end

  def new
    @song = Song.new
    @mixtape = Mixtape.new
  end

  def search
    query = params[:q]
    @results = TinySonger.search(params[:q])
    respond_to do |format|
      format.json{ render :json => @results.collect{ |n| {:id => n.tiny_id, :name => "#{n.artist}: #{n.title}"}}.to_json }
    end
  end

  def create
    @mixtape = Mixtape.create(params[:mixtape])
    # redirect_to mixtape_play_path(@mixtape.mixtape_url)
    if @mixtape.save
      redirect_to new_design_path(:mixtape_url => @mixtape.mixtape_url)
    else
      render :new
    end
  end

  def show
    @mixtape = Mixtape.find_by_mixtape_url(params[:mixtape_url])
  end

  def update
    @mixtape = Mixtape.find(params[:id])
    if @mixtape.update_attributes(params[:mixtape])
      redirect_to mixtape_play_path(@mixtape.mixtape_url)
    end
  end

end