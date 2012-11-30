class SongsController < ApplicationController

  def show
    @artist = params[:artist]
    @title = params[:title]

    respond_to do |format|
      format.js
    end
  end

  def create
    # this should be:  Song.new(params[:song])
    # youtube_id = Result.get_youtube_id(@song.artist, @song.title)
    # or....  Song.create(params[:song].merge(:youtube_id => youtube_id))
    @song = Song.new(:title => params[:title], :artist => params[:artist], :tiny_id => params[:tiny_id])
    @song.youtube_id = Result.get_youtube_id(@song.artist, @song.title)
    @song.save
    respond_to do |format|
      format.js
    end
  end

end