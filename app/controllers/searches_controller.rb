class SearchesController < ApplicationController
  include SessionsHelper
  helper_method :current_user
  before_filter :authorize_user

  def new
    query = params[:q]
    @results = TinySonger.search(params[:q])
    respond_to do |format|
      format.json{ render :json => @results }
    end
  end

end
