class MixtapesController < ApplicationController

  def index
  end

  def new
    @mixtape = Mixtape.new
  end

  def search
    # the query passed to TinySong can't contain spaces. 'new order' => 'new%20order'
    query = params[:query]
    @results = Search.new(query.gsub(" ", "%20")).all_songs
    respond_to do |format|
      format.js {render 'search.js.erb'}
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