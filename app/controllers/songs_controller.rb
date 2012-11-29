class SongsController < ApplicationController

  def show
    @artist = params[:artist]
    @title = params[:title]

    respond_to do |format|
      format.js
    end
  end

  def create
    @song = Song.new(:title => params[:title], :artist => params[:artist], :tiny_id => params[:tiny_id], :youtube_id => params[:youtube_id])
    respond_to do |format|
      format.js if @song.save
    end
  end

end