class StaticPagesController < ApplicationController
  include SessionsHelper
  helper_method :current_user
  skip_filter :authorize_user
   
  def home
    @mixtape = Mixtape.last
  end
end
