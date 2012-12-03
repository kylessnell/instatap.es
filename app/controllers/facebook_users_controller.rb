class FacebookUsersController < ApplicationController
  
  def create
    self.current_user = User.from_omniauth(env["omniauth.auth"])
  end

  def destroy
    cookies.delete(:remember_token)
    clear_session
    redirect_to root_url
  end 

end
