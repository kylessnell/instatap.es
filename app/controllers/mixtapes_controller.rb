class MixtapesController < ApplicationController

  def index
  end

  def new
    @mixtape = Mixtape.new
  end

  def search
    # the query passed to TinySong can't contain spaces. 'new order' => 'new%20order'

  end

  def create
    @mixtape = Mixtape.create(params[:mixtape])
    redirect_to "/#{@mixtape.mixtape_url}"
  end

  def show
    @mixtape = Mixtape.find_by_mixtape_url(params[:mixtape_url])
    query = params[:q]
    @results = Search.new(query.gsub(" ", "%20")).all_songs
    respond_to do |format|
      format.json{ render :json => @results.collect{ |n| {:id => n.tiny_id, :name => "#{n.artist} #{n.title}"}}.to_json }
    end
  end
end