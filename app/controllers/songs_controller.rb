class SongsController < ApplicationController
  
  def show
    @api_id = params[:id].to_s # dependent on the tinysong api which is an integer for songID
    @artist = params[:artist]
    @title = params[:title]

    respond_to do |format|
      format.js
    end
  end

end