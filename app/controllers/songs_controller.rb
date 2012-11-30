class SongsController < ApplicationController

  def show
    @artist = params[:artist]
    @title = params[:title]

    respond_to do |format|
      format.js
    end
  end

  def create
    @song = Song.new(:title => params[:title], :artist => params[:artist], :tiny_id => params[:tiny_id])
    @song.youtube_id = Result.get_youtube_id(@song.artist, @song.title)
    respond_to do |format|
      format.js{render "create.js.erb"} if @song.save
    end
  end

end