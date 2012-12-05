class StaticPagesController < ApplicationController
  def home
    @mixtape = Mixtape.last
  end
end
