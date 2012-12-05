class SearchesController < ApplicationController
  def new
    query = params[:q]
    @results = TinySonger.search(params[:q])
    respond_to do |format|
      format.json{ render :json => @results }
    end
  end

end
