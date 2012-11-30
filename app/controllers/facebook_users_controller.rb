class FacebookUsersController < ApplicationController
  
  def create
    # request. find where they were
    self.current_user = User.from_omniauth(env["omniauth.auth"])
    # redirect_to whereever they came from
  end

  def destroy
    cookies.delete(:remember_token)
    clear_session
    redirect_to root_url
  end 

end
