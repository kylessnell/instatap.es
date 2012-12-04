class SearchesController < ApplicationController
  def new
    query = params[:q]
    @results = TinySonger.search(params[:q])
    respond_to do |format|
      format.json{ render :json => @results.collect{ |n| {:id => n.tiny_id, :name => "#{n.artist}: #{n.title}"}}.to_json }
    end
  end

end
