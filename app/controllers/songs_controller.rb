class SongsController < ApplicationController

  def show
    @artist = params[:artist]
    @title = params[:title]

    respond_to do |format|
      format.js
    end
  end

  def create
    @song = Song.new(params[:song])
    @song.youtube_id = Result.get_youtube_id(@song.artist, @song.title)
    @song.save
    respond_to do |format|
      format.js
    end
  end

end