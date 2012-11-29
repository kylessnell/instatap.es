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
    respond_to do |format|
      format.js if @song.save
    end
  end

end