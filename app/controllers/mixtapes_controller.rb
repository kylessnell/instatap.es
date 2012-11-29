require 'youtube_search.rb'
class MixtapesController < ApplicationController

  def index
  end

  def new
    @mixtape = Mixtape.new
  end

  def search
    # the query passed to TinySong can't contain spaces. 'new order' => 'new%20order'
    @results = Search.new(params[:query]).all_songs
    respond_to do |format|
      format.js {render 'search.js.erb'}
    end
  end

  def create
    @mixtape = Mixtape.create(params[:mixtape])
    #@mixtape.songs = Song.find_all_by_id(song_ids)
  end

	def show
		@mixtape = Mixtape.find_by_mixtape_url(params[:mixtape_url])
	end
end