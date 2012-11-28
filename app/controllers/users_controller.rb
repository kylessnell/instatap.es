class UsersController < ApplicationController
  skip_filter :authorize_user, :only => [:index]

  def index
  end
end