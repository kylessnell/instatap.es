class MixtapesController < ApplicationController

  def index
  end

  def new
    @song = Song.new
    @mixtape = Mixtape.new
  end

  def search
    query = params[:q]
    @results = Search.new(query.gsub(" ", "%20")).all_songs
    respond_to do |format|
      format.json{ render :json => @results.collect{ |n| {:id => n.tiny_id, :name => "#{n.artist}: #{n.title}"}}.to_json }
    end
  end

  def create
    @mixtape = Mixtape.create(params[:mixtape])
    redirect_to "/#{@mixtape.mixtape_url}"
  end

  def show
    @mixtape = Mixtape.find_by_mixtape_url(params[:mixtape_url])
  end

end