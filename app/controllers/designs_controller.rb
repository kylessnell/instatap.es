class DesignsController < ApplicationController
  include SessionsHelper
  helper_method :current_user
  before_filter :authorize_user

  def new
    @mixtape = Mixtape.find_by_url(params[:url])
  end
end
