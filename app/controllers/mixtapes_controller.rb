class MixtapesController < ApplicationController
  def index
  end

  def new
    @mixtape = Mixtape.new
  end

  def search
    @results = TinySonger.search(params[:query])
    @results.each { |r| puts r.title }
    respond_to do |format|
      format.js
    end
  end

  def create
    @mixtape = Mixtape.create(params[:mixtape])
    redirect_to mixtape_play_path(@mixtape.mixtape_url)
  end

  def show
    @mixtape = Mixtape.find_by_mixtape_url(params[:mixtape_url])
  end
end