class StaticPagesController < ApplicationController
  def home
    @mixtape = Mixtape.find_by_url('4947c0')
  end
end
