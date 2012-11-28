class FacebookUsersController < ApplicationController
  
  def create
    # request. find where they were
    user = User.from_omniauth(env["omniauth.auth"])
    # redirect_to whereever they came from
  end

  def destroy
    user = nil
    session[:user_id] = nil
    redirect_to root_url
  end 

end
